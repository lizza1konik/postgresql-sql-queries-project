-- Show visitors who bought a backstage pass to Shakira's concert and to no one else
(
    SELECT p.name, p.surname
    FROM person p
             JOIN visitor v         ON p.id_person      = v.id_person
             JOIN backstage_pass bp ON v.id_person      = bp.id_person
             JOIN performer p2      ON bp.performer_id_person = p2.id_person
    WHERE p2.pseudonym = 'Shakira'
)
EXCEPT
(
    SELECT p.name,p.surname
    FROM person p
             JOIN visitor v         ON p.id_person      = v.id_person
             JOIN backstage_pass bp ON v.id_person      = bp.id_person
             JOIN performer p2      ON bp.performer_id_person = p2.id_person
    WHERE p2.pseudonym != 'Shakira'
);