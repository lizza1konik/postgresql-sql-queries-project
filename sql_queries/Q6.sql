-- Show the stage with the cheapest rental price
SELECT s.name, r.price
FROM stage s
JOIN rent r ON s.id_rent = r.id_rent
ORDER BY r.price ASC
LIMIT 1;