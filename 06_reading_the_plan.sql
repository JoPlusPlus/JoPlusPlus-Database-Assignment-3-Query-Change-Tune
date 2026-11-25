-- TASK 6

SELECT TOP (15)
	i.InvoiceNumber,
	sp.StudentNumber,
	i.TotalAmount - i.PaidAmount AS Remaining,
	CASE WHEN i.DueAtUtc < DATEADD(DAY, -60, SYSUTCDATETIME()) THEN 'Urgent' ELSE 'Normal' END AS Urgency

FROM finance.Invoices AS i
INNER JOIN [identity].StudentProfiles AS sp ON sp.Id = i.StudentId
WHERE i.PaidAmount < i.TotalAmount AND i.DueAtUtc < SYSUTCDATETIME()
ORDER BY Remaining DESC;

/*
	OPERATORS I EXPECT
	1. from -> index operators
	2. where -> filter,sort
	3. Join -> Nested Loops, Hash Match, Merge Join
	4. order by -> Sort
	5. Top -> Top operator
	6. Select  -> Compute Scalar
*/



