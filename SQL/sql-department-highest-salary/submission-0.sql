-- Write your query below
WITH ranked AS (
    SELECT
        name AS employee,
        salary,
        department_id,
        RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk
    FROM employee
)

SELECT
    d.name AS department,
    r.employee,
    r.salary
FROM ranked r
INNER JOIN department d ON r.department_id = d.id
WHERE r.rnk = 1;
