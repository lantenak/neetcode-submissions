-- Write your query below
WITH employee_experience AS (
    SELECT
        p.project_id,
        p.employee_id,
        e.experience_years,
        RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS rnk
    FROM project p
    INNER JOIN employee e ON p.employee_id = e.employee_id
)

SELECT
    project_id,
    employee_id
FROM employee_experience
WHERE rnk = 1;
