-- Show the number of performers that each staff_member worked with
SELECT sm.id_person,
       p.name,
       p.surname,
       (SELECT COUNT(*)
        FROM staff_member_performer smp
        WHERE smp.staff_member_id_person = sm.id_person
       ) AS performer_count
FROM staff_member sm
JOIN person p ON sm.id_person = p.id_person
ORDER BY performer_count DESC;