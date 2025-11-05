-- Show all rich staff members that are older than 70
SELECT * FROM person p
WHERE EXISTS
(
    SELECT 1
    FROM rich r
    WHERE r.id_person = p.id_person
)
AND age > 70;