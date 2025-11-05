-- Show staff members that worked with every performer
SELECT p.id_person, p.name, p.surname
FROM staff_member sm
JOIN person p ON sm.id_person = p.id_person
WHERE NOT EXISTS
(
    SELECT 1
    FROM performer pr
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM staff_member_performer smp
        WHERE smp.staff_member_id_person = sm.id_person
        AND smp.performer_id_person   = pr.id_person
    )
);