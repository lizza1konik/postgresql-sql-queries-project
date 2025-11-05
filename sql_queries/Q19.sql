-- Create a view 'rich' for staff members with salary > 30000
CREATE OR REPLACE VIEW rich AS
SELECT * FROM person
WHERE EXISTS
(
    SELECT 1
    FROM staff_member
    WHERE staff_member.id_person = person.id_person
    AND staff_member.salary > 30000
)
WITH CHECK OPTION;

SELECT * FROM rich;