DECLARE @LoanID INT = 11;
SELECT dbo.CalculateOverdueDays(@LoanID) AS OverdueDays;

SELECT * FROM Library.Loans;
