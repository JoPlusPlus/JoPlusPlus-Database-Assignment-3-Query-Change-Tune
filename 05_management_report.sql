-- 5.1
select Code as CourseCode,Title,CreditHours
from academic.Courses
ORDER BY CreditHours DESC, Title


-- 5.2
select TOP 5 * from [identity].StudentProfiles
ORDER BY NEWID()

-- 5.3
-- there wasnt such emails in the DB . so i updated users 1 2 3, to have spaces at start, end , and both respectively
select * from [identity].Users
where Email like ' %' or Email like '% '

-- 5.4
select * from [identity].Users
where email <> LOWER(Email)

-- 5.5
select * from [identity].Users
WHERE Email NOT LIKE '%@%' OR Email LIKE '@%' OR Email NOT LIKE '%@%.%'

-- 5.6
select distinct SUBSTRING(Email,CHARINDEX('@',Email) + 1, LEN(Email)) AS Provider
from [identity].Users

-- 5.7
select * from [identity].Users
ORDER BY LastLoginAtUtc DESC

-- 5.8
select * from finance.Payments
where CONVERT(DATE,PaidAtUtc) >= '2026-10-01' AND PaidAtUtc < '2026-11-01' 
ORDER BY PaidAtUtc ASC

-- 5.9
SELECT Id, InvoiceId, Amount, CurrencyCode,
        CAST(PaidAtUtc AT TIME ZONE 'UTC' AT TIME ZONE 'Egypt Standard Time' AS datetime2(0)) AS PaidAtCairo
FROM finance.Payments
WHERE DATEPART(HOUR, PaidAtUtc AT TIME ZONE 'UTC' AT TIME ZONE 'Egypt Standard Time') > 5
ORDER BY PaidAtCairo ASC;

-- 5.10
select * from attendance.AttendanceSessions
where DATENAME(WEEKDAY,StartsAtUtc) = 'Friday'

-- 5.11
select 
    id,Email,FirstName,LastName,PhoneNumber
from [identity].Users
where PhoneNumber LIKE '+201[0125][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'

-- 5.12
select
    CONCAT(SUBSTRING(PhoneNumber,3,3),'******',SUBSTRING(PhoneNumber,12,2))
from [identity].Users

-- 5.13
-- select InvoiceNumber from finance.Invoices

select 
    TRY_CAST(RIGHT(InvoiceNumber,CHARINDEX('-',REVERSE(InvoiceNumber)) - 1) AS INT) AS ExtractedNumber
from finance.Invoices
ORDER BY ExtractedNumber

SELECT InvoiceNumber,
       TRY_CAST(RIGHT(InvoiceNumber, PATINDEX('%[^0-9]%', REVERSE(InvoiceNumber)) - 1) AS INT) AS Number
FROM finance.Invoices
ORDER BY Number;

-- 5.14

select
    id,
    ModuleId,
    Title,
    EstimatedMinutes,
    CASE
        WHEN EstimatedMinutes IS NULL THEN 'Not Set'
        ELSE CAST(EstimatedMinutes / 60 AS varchar(2)) + 'hr ' + CAST(EstimatedMinutes % 60 AS VARCHAR(2)) + 'Min'
    END AS LessonLength
from content.Lessons
-- where id = 6367

/* update content.Lessons
set EstimatedMinutes = 90
where id = 6367
*/

-- 5.15
select * from communication.Announcements
where 
    (Title LIKE '[%]%' OR Title LIKE '%[%]')
    OR (Body LIKE '[%]%' OR Body LIKE '%[%]')

-- 5.16
SELECT TOP 5 WITH TIES
    Id,InvoiceNumber,CurrencyCode,TotalAmount
FROM finance.Invoices
ORDER BY TotalAmount DESC

-- 5.17
SELECT TOP 10 PERCENT
    Id,
    InvoiceId,
    CurrencyCode,
    Amount
FROM finance.Payments
ORDER BY Amount DESC

-- 5.18
SELECT * 
FROM delivery.Sections
WHERE Location IS NULL OR Location NOT LIKE '%Hall A%'

-- 5.19
-- SELECT * FROM finance.Invoices
SELECT
    Id,
    InvoiceNumber,
    CurrencyCode,
    TotalAmount,
    PaidAmount,
    CASE
        WHEN PaidAmount = 0.0 THEN 'Not Paid'
        ELSE 'Partily Paid'
    END AS PaymentStatus,
    CASE
        WHEN PaidAmount <> 0.0 THEN CAST((PaidAmount/TotalAmount)*100 AS decimal(3,1))
        ELSE 0.0
    END AS PaymentPercentage,
    DueAtUtc,
    CASE
        WHEN SYSUTCDATETIME() > DueAtUtc THEN 'Overdue'
        ELSE 'Not Overdue'
    END AS OverdueStatus
FROM finance.Invoices
WHERE PaidAmount < TotalAmount
ORDER BY PaidAmount ASC

-- 5.20
SELECT Id, FirstName, LastName, Email, CreatedAtUtc
FROM [identity].Users
WHERE IsDeleted = 0
ORDER BY CreatedAtUtc DESC, Id DESC
OFFSET 40 ROWS FETCH NEXT 20 ROWS ONLY;

-- 5.21
-- ASSUME LAST SHOWN ID = 100,000

SELECT TOP 50 * 
FROM operations.AuditLogs
WHERE Id > 100050
ORDER BY Id

-- 5.22
-- NO, MUST SORT BY DATE FIRST
SELECT TOP 10 *
FROM finance.Payments
ORDER BY CreatedAtUtc DESC

-- 5.23
/*UPDATE [content].Lessons
    SET Title = 'Overview and Learning Outcomes ABCDEFGHIJKLDWDWDASQ',
    IsPublished = 0
WHERE Id = 4*/
--SELECT * FROM content.Lessons;

SELECT DISTINCT TOP 10
    Title,
    LEN(Title) AS TitleLength,
    EstimatedMinutes,
    CASE
        WHEN EstimatedMinutes IS NULL OR EstimatedMinutes = 0 THEN 'Not Set'
        WHEN EstimatedMinutes <= 15 THEN 'Quick'
        WHEN EstimatedMinutes <= 45 THEN 'Standard'
        ELSE 'Long'
    END AS Duration
FROM content.Lessons
WHERE LEN(Title) > 40
ORDER BY TitleLength DESC

-- 2.24
-- SELECT * FROM finance.Invoices

SELECT DISTINCT TOP 12
    CONVERT(char(7), DueAtUtc, 120) AS DueMonth,
    CurrencyCode,
    CASE
        WHEN PaidAmount = 0.0 THEN 'Not Paid'
        ELSE 'Partially Paid'
    END AS PaymentStatus
FROM finance.Invoices
WHERE SYSUTCDATETIME() > DueAtUtc AND PaidAmount < TotalAmount
ORDER BY DueMonth DESC, CurrencyCode, PaymentStatus