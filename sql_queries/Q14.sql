-- Show visitors' names and surnames who bought a backstage pass to both Britney Spears and Rihanna
SELECT p.name, p.surname
FROM person p
JOIN (
    SELECT v.id_person
    FROM visitor v
    JOIN backstage_pass bp  ON v.id_person = bp.id_person
    JOIN performer      pr  ON bp.performer_id_person = pr.id_person
    WHERE pr.pseudonym = 'Rihanna'

    INTERSECT

    SELECT v1.id_person
    FROM visitor v1
    JOIN backstage_pass bp1 ON v1.id_person = bp1.id_person
    JOIN performer      pr1 ON bp1.performer_id_person = pr1.id_person
    WHERE pr1.pseudonym = 'Britney Spears'
) both ON p.id_person = both.id_person;