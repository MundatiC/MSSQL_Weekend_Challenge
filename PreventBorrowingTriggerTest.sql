

INSERT INTO Library.Loans (BookID, MemberID, LoanDate, ReturnDate)
VALUES (4, 1, GETDATE(), DATEADD(DAY, 7, GETDATE()));
