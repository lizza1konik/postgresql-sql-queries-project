-- Unite all rented equipment for current performance to see what exactly was used
SELECT se.id_rent AS sound_equipment,
       se.name_of_set,
       s.id_rent  AS stage,
       s.name
FROM stage s
FULL OUTER JOIN sound_equipment se ON s.id_rent = se.id_rent;