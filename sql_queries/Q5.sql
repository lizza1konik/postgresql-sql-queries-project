-- Show the id_ticket, price, and type for VIP tickets only
SELECT DISTINCT id_ticket, price, type
FROM ticket
WHERE type = 'VIP';