-- TASK 11

-- 11.1
	-- THIS REQUIRES JOIN academic.courses as c with academic.departments as d
	-- on c.DepartmentId = d.id
	-- we didnt take join yet

-- 11.2
SELECT * FROM delivery.Enrollments;

UPDATE delivery.Enrollments
SET FinalGrade = CASE
					WHEN FinalScore IS NULL THEN '-'
					WHEN FinalScore >= 90 THEN 'A'
					WHEN FinalScore >= 80 THEN 'B'
					WHEN FinalScore >= 70 THEN 'C'
					WHEN FinalScore >= 60 THEN 'D'
					ELSE 'F'
				END;

-- 11.3
SELECT * FROM [identity].ROLES

DELETE FROM [identity].Roles
WHERE Id = 6;

-- 11.4
CREATE TABLE finance.PaymentStaging (
    InvoiceId bigint NOT NULL,
    PaymentMethodId tinyint NOT NULL,
    Amount decimal(18,2) NOT NULL,
    CurrencyCode char(3) NOT NULL,
    ExternalReference nvarchar(200) NULL,
    PaidAtUtc datetime2 NULL
);

INSERT INTO finance.PaymentStaging (InvoiceId, PaymentMethodId, Amount, CurrencyCode, ExternalReference, PaidAtUtc)
SELECT TOP 3 InvoiceId, PaymentMethodId, Amount, CurrencyCode, ExternalReference, PaidAtUtc
FROM finance.Payments
ORDER BY Id;


TRUNCATE TABLE finance.PaymentStaging;

-- 11.5
DROP TABLE [dbo].Archive;
DROP TABLE finance.PaymentStaging;

