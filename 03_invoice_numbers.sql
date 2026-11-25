-- 3.1
CREATE SEQUENCE dbo.InvoiceSeq
START WITH 1
INCREMENT BY 1

-- 3.2
select * from finance.Invoices;
select * from [identity].StudentProfiles
select * from [identity].Users
select * from delivery.AcademicTerms;

INSERT INTO finance.Invoices(InvoiceNumber,StudentId,TermId,IssuedAtUtc,DueAtUtc,TotalAmount)
VALUES(
	'LAB-INV-' + CAST( YEAR(GETDATE()) AS VARCHAR(4)) + RIGHT('000000' + CAST(NEXT VALUE FOR dbo.InvoiceSeq AS varchar(6)),6),
	304,
	17,
	GETDATE(),
	DATEADD(DAY,30,GETDATE()),
	4500
);
-- 3.3

BEGIN Transaction;
	select next value for dbo.InvoiceSeq;
ROLLBACK Transaction;

select next value for dbo.InvoiceSeq;
-- value increased not rolled back
