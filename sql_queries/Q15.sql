-- Show all of the persons that are not visitors
SELECT p.*
FROM person p
LEFT JOIN visitor v ON p.id_person = v.id_person
WHERE v.id_person IS NULL;