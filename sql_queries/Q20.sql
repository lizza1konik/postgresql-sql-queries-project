-- Delete all staff members that are rich
BEGIN;

SELECT COUNT(id_person) FROM rich;

DELETE FROM staff_member
WHERE id_person IN (SELECT id_person FROM rich);

SELECT COUNT(id_person) FROM rich;

ROLLBACK;