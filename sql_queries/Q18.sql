-- Alysa Neeeds is the most effective staff_member. Increase Alysa's salary by 500
BEGIN;

SELECT p.id_person, p.name, p.surname, sm.salary
FROM person p
JOIN staff_member sm ON p.id_person = sm.id_person
WHERE LOWER(p.name) = 'alysa';

UPDATE staff_member
SET salary = salary + 500
WHERE id_person IN
(
    SELECT sm.id_person
    FROM person p
    JOIN staff_member sm ON p.id_person = sm.id_person
    WHERE LOWER(p.name) = 'alysa'
);

SELECT p.id_person, p.name, p.surname, sm.salary
FROM person p
JOIN staff_member sm ON p.id_person = sm.id_person
WHERE LOWER(p.name) = 'alysa';

ROLLBACK;