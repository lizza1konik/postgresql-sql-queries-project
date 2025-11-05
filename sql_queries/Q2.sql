-- Show performers' names and surnames who have a concert on stage 15
SELECT p.name, p.surname
FROM person p
JOIN performer per ON p.id_person = per.id_person
JOIN performance perform ON perform.id_person = per.id_person
WHERE perform.id_stage = 15;