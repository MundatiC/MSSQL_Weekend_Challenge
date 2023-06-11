CREATE TRIGGER PreventExceedingBorrowLimit
ON Library.Loans
INSTEAD OF INSERT
AS
BEGIN
  IF (SELECT COUNT(*) FROM Library.Loans WHERE MemberID IN (SELECT MemberID FROM inserted)) + (SELECT COUNT(*) FROM inserted) > 3
  BEGIN
    RAISERROR ('Maximum borrow limit reached for this member.', 16, 1);
    ROLLBACK TRANSACTION;
  END
  ELSE
  BEGIN
    INSERT INTO Library.Loans (BookID, MemberID, LoanDate, ReturnDate)
    SELECT BookID, MemberID, LoanDate, ReturnDate FROM inserted;
  END
END;
