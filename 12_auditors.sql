-- TASK 12

-- 12.1
	-- COULDN'T DO IT


-- 12.2
/*SELECT * FROM communication.Announcements
WHERE ExpiresAtUtc < DATEADD(MONTH,-6,SYSUTCDATETIME())*/

CREATE TABLE communication.AnnouncementsArchive (
    Id bigint,
    SectionId bigint,
    Title nvarchar(200),
    Body nvarchar(max),
    PublishedAtUtc datetime2,
    ExpiresAtUtc datetime2,
    CreatedByUserId bigint,
    CreatedAtUtc datetime2,
    UpdatedAtUtc datetime2,
    Status tinyint
);

DELETE FROM communication.Announcements
OUTPUT deleted.*
INTO communication.AnnouncementsArchive
WHERE ExpiresAtUtc < DATEADD(MONTH,-6,SYSUTCDATETIME())