-- Task 1 — The Finance Meeting
USE LmsTrainingLab;

-- 1.1
SELECT StudentId,TotalAmount, PaidAmount, TotalAmount - PaidAmount AS LeftAmount, DATEDIFF(DAY,DueAtUtc,SYSDATETIME()) AS Days
FROM [finance].[Invoices]
WHERE TotalAmount - PaidAmount <> 0

-- 1.2 & 1.3
SELECT StudentId,TotalAmount, PaidAmount, TotalAmount - PaidAmount AS LeftAmount, DATEDIFF(DAY,DueAtUtc,SYSDATETIME()) AS Days
FROM [finance].[Invoices]
WHERE TotalAmount - PaidAmount <> 0
ORDER BY
		CASE  
			WHEN DATEDIFF(DAY,DueAtUtc,SYSDATETIME()) > 60 OR (TotalAmount - PaidAmount) > 10000 THEN 1
			WHEN DATEDIFF(DAY,DueAtUtc,GETDATE()) > 30 THEN 2
			ELSE 3
		END ASC,
		LeftAmount DESC;