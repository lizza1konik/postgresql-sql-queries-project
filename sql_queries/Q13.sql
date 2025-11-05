-- Select and show all the locations that take place in Poland or in the USA
SELECT city, country, name
FROM location
WHERE country IN ('Poland', 'USA');