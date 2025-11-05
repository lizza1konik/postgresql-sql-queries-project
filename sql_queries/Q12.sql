-- Show sound equipment that was never rented
SELECT se.company_name
FROM sound_equipment se
WHERE NOT EXISTS (
    SELECT 1
    FROM rent r
    WHERE se.id_rent = r.id_rent
);