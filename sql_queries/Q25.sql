-- Show group tickets priced > 1200 with more than 2 visitors (with visitor details)
SELECT
    t.price,
    t.type,
    t.id_ticket,
    v.id_person,
    v.email,
    v.contact_number,
    visitor_counts.group_ticket
FROM (
         SELECT id_ticket, COUNT(id_person) AS group_ticket
         FROM visitor
         GROUP BY id_ticket
         HAVING COUNT(id_person) > 2
) AS visitor_counts
JOIN ticket  t ON visitor_counts.id_ticket = t.id_ticket
JOIN visitor v ON t.id_ticket = v.id_ticket
WHERE t.price > 1200
ORDER BY visitor_counts.group_ticket DESC;