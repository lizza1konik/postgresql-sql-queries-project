-- Show id of the stage that was rented for Pink's concert
SELECT DISTINCT s.id_stage
FROM stage s
JOIN performance pf ON s.id_stage = pf.id_stage
JOIN performer pr ON pf.id_person = pr.id_person
WHERE pr.pseudonym = 'Pink';