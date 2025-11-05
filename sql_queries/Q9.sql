-- Show the performer with the biggest salary
SELECT performer.pseudonym, performer.salary
FROM performer
ORDER BY salary DESC
LIMIT 1;