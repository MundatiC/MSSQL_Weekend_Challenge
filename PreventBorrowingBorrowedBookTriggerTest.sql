INSERT INTO Library.Loans (BookID, MemberID, LoanDate, ReturnDate)
VALUES (1, 1, GETDATE(), DATEADD(DAY, 7, GETDATE()));


SELECT * FROM Library.Loans