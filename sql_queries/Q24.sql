-- A visitor decided to become a staff member. Add them with a random salary
BEGIN;

SELECT * FROM staff_member;

INSERT INTO staff_member (id_person, salary)
SELECT id_person, ROUND(RANDOM() * 20000) + 1 AS salary
FROM person
ORDER BY RANDOM()
LIMIT 1;

SELECT * FROM staff_member;

ROLLBACK;