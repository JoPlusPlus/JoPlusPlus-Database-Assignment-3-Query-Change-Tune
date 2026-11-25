-- TASK 7

/*
	indexطيب احنا لسه مخدناش ال 
	حل مشكلة ايه؟؟ index ازاي هعرف ال 
	وازاي استخدمه هنا عشان احسن الاداء؟
*/

CREATE INDEX IX_Users_Email ON [identity].Users (Email) INCLUDE (FirstName, LastName);
CREATE INDEX IX_Users_LastName ON [identity].Users (LastName) INCLUDE (FirstName, Email);
CREATE INDEX IX_Users_CreatedAtUtc ON [identity].Users (CreatedAtUtc) INCLUDE (Email);
CREATE INDEX IX_Payments_PaidAtUtc ON finance.Payments (PaidAtUtc) INCLUDE (InvoiceId, Amount);
CREATE INDEX IX_Invoices_Number ON finance.Invoices (InvoiceNumber);

-- 7.1 before
SET STATISTICS IO ON;

SELECT Id, Email
FROM [identity].Users
WHERE YEAR(CreatedAtUtc) = 2026
AND MONTH(CreatedAtUtc) = 3;

SET STATISTICS IO OFF;

-- 7.1 after
SET STATISTICS IO ON;

SELECT Id, Email
FROM [identity].Users
WHERE CreatedAtUtc >= '2026-03-1' AND CreatedAtUtc < '2026-04-1'

SET STATISTICS IO OFF;

-- 7.2 BEFORE
SET STATISTICS IO ON;

SELECT Id, InvoiceId, Amount
FROM finance.Payments
WHERE DATEDIFF(DAY, PaidAtUtc,SYSUTCDATETIME()) <= 30;

 SET STATISTICS IO OFF;


 -- 7.2 AFTER
SET STATISTICS IO ON;

SELECT Id, InvoiceId, Amount
FROM finance.Payments
WHERE PaidAtUtc >= DATEADD(DAY,-30,SYSUTCDATETIME())

 SET STATISTICS IO OFF;


-- 7.3 BEFORE
SET STATISTICS IO ON;

SELECT Id, FirstName, LastName
FROM [identity].Users
WHERE LEFT(LastName, 3) = N'Abd';

SET STATISTICS IO OFF;


 -- 7.3 AFTER
SET STATISTICS IO ON;

SELECT Id, FirstName, LastName
FROM [identity].Users
WHERE LastName LIKE 'Abd%'

SET STATISTICS IO OFF;

 -- 7.4 BEFORE
SET STATISTICS IO ON;

SELECT *
FROM operations.AuditLogs
WHERE Id + 1 = 50001;

 SET STATISTICS IO OFF;


 -- 7.4 AFTER
SET STATISTICS IO ON;

SELECT *
FROM operations.AuditLogs
WHERE Id = 5000;

 SET STATISTICS IO OFF;

 -- 7.5 BEFORE
SET STATISTICS IO ON;

SELECT Id,InvoiceNumber, TotalAmount, PaidAmount
FROM finance.Invoices
WHERE InvoiceNumber = N'LAB-INV-2026000001';

SET STATISTICS IO OFF;


 -- 7.5 AFTER
SET STATISTICS IO ON;

SELECT Id,InvoiceNumber, TotalAmount, PaidAmount
FROM finance.Invoices
WHERE InvoiceNumber = 'LAB-INV-2026000001';

SET STATISTICS IO OFF;


 -- 7.6 BEFORE
SET STATISTICS IO ON;

DECLARE @Email NVARCHAR(320) = N' academic.office@northbridge.edu';

SELECT Id, FirstName, LastName
FROM [identity].Users
WHERE UPPER(Email) = UPPER(@Email);

SET STATISTICS IO OFF;


 -- 7.6 AFTER
SET STATISTICS IO ON;

--DECLARE @Email NVARCHAR(320) = N' academic.office@northbridge.edu';

SELECT Id, FirstName, LastName
FROM [identity].Users
WHERE (Email) = (@Email);

SET STATISTICS IO OFF;

 -- 7.7 BEFORE
SET STATISTICS IO ON;

DECLARE @LastName NVARCHAR(100) = N'Hassan';

SELECT Id, FirstName, Email
FROM [identity].Users
WHERE (@LastName IS NULL OR LastName = @LastName);


SET STATISTICS IO OFF;


 -- 7.7 AFTER
SET STATISTICS IO ON;

	-- DONT KNOW

SET STATISTICS IO OFF;


 -- 7.8 BEFORE
SET STATISTICS IO ON;

	-- PASS THIS ONE
SET STATISTICS IO OFF;


 -- 7.8 AFTER
SET STATISTICS IO ON;


 SET STATISTICS IO OFF;