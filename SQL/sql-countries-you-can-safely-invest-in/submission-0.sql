-- Write your query below
SELECT co.name AS country
FROM person p
JOIN country co ON SUBSTRING(p.phone_number, 1, 3) = co.country_code
JOIN (
    SELECT caller_id AS person_id, duration FROM calls
    UNION ALL
    SELECT callee_id AS person_id, duration FROM calls
) ca ON p.id = ca.person_id
GROUP BY co.name
HAVING AVG(ca.duration) > (SELECT AVG(duration) FROM calls);
