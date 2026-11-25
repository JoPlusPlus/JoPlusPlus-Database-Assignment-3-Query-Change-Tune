INSERT INTO delivery.Sections
    (CourseId, TermId, SectionCode, Capacity, Location, CreatedAtUtc, DeliveryMode, Status)
SELECT CourseId, 17, SectionCode, Capacity, Location, SYSUTCDATETIME(), DeliveryMode, Status
FROM delivery.Sections
WHERE TermId = 12;

