-- Select all people that are visitors and sort them by name (descending) and age (ascending)
SELECT p.* FROM person p
JOIN visitor v ON p.id_person = v.id_person
ORDER BY age ASC, name DESC;