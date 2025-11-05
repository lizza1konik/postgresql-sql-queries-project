-- Show all the visitors for a location that is located in Poland
SELECT l.id_loc, l.country, l.city,
       v.id_person, v.email, v.contact_number
FROM location l
LEFT JOIN visitor v ON l.id_loc = v.id_loc
WHERE l.country = 'Poland';