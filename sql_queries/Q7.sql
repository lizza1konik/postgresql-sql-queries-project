-- Show an employee that works at the location 'Walgreens'
SELECT DISTINCT
    p.name,
    p.surname,
    l.name AS location_name
FROM staff_member sm
JOIN person p ON sm.id_person = p.id_person
JOIN visitor v ON p.id_person = v.id_person
JOIN location l ON v.id_loc = l.id_loc
WHERE l.name = 'Walgreens';