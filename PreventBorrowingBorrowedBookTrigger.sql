CREATE TRIGGER PreventBorrowingLoanedBook
ON Library.Loans
FOR INSERT
AS
BEGIN
  
  IF EXISTS (
    SELECT *
    FROM inserted i
    JOIN Library.Books b ON i.BookID = b.BookID
    WHERE b.Status = 'Loaned'
  )
  BEGIN
    
    RAISERROR ('The book is already loaned and cannot be borrowed.', 16, 1);
    ROLLBACK TRANSACTION;
    RETURN;
  END
  
  
  INSERT INTO Library.Loans (BookID, MemberID, LoanDate, ReturnDate)
  SELECT BookID, MemberID, LoanDate, ReturnDate
  FROM inserted;
END;
