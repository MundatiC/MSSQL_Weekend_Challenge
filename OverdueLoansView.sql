CREATE VIEW OverdueLoans AS
SELECT Books.Title, Members.Name, dbo.CalculateOverdueDays(Loans.LoanID) AS OverdueDays
FROM Library.Loans
JOIN Library.Books ON Loans.BookID = Books.BookID
JOIN Library.Members ON Loans.MemberID = Members.MemberID
WHERE Loans.ReturnDate < GETDATE();


