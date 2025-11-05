-- Show all performers (name, surname, salary) that have an assistantship
SELECT p.name, p.surname, p.salary
FROM person p
NATURAL JOIN performer
NATURAL JOIN staff_member_performer;