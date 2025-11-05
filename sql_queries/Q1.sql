-- Show performers' names and surnames who have a concert on stage 15
SELECT p.name, p.surname
FROM person p
JOIN performer per ON p.id_person = per.id_person
JOIN performance perf ON perf.id_person = per.id_person
WHERE perf.id_stage = 15;