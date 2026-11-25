-- Task 2 — A New Department

-- 2.1
INSERT INTO [academic].Departments(Code,Name) VALUES('DSAI','Data Science & Artificial Intelligence');
-- select * from academic.Departments

-----------------------------------------------------
-- 2.2
INSERT INTO academic.Courses(DepartmentId,Code,Title,PassingScore,CreditHours) 
	VALUES(19,'DSAI-101',' Introduction to Data Analysis',60,3);

-----------------------------------------------------
-- 2.3
-- select * from  [delivery].AcademicTerms
INSERT INTO [delivery].AcademicTerms(AcademicYear,TermCode,Name,StartDate,EndDate,RegistrationStartDate,RegistrationEndDate)
VALUES (2027,'SUMMER','Summer 2027', CONVERT(DATE, '15-06-2027', 105),CONVERT(DATE, '31-08-2027', 105),
	CONVERT(DATE, '01-05-2027', 105),CONVERT(DATE, '10-06-2027', 105))

-----------------------------------------------------
-- 2.4
-- assuming NULL sectionId means global to all sections
-- select * from  communication.Announcements where Title LIKE 'New term%'
INSERT INTO communication.Announcements(SectionId,Title,Body,PublishedAtUtc,ExpiresAtUtc,CreatedByUserId)
VALUES(NULL,'New term announce','New summer term opens soon',CONVERT(DATE,'01-06-2027'),CONVERT(DATE,'05-06-2027'),1);

-----------------------------------------------------
-- 2.5
-- select * from [identity].Roles
INSERT INTO [identity].Roles(Code,name,Description) VALUES ('TEACHING_ASSISTANT','Teaching Assistants','Assist main instructor');