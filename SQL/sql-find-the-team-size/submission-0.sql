-- Write your query below
SELECT
    employee.employee_id,
    team_count.team_size
FROM employee
INNER JOIN (
    SELECT
        team_id,
        COUNT(*) AS team_size
    FROM employee
    GROUP BY team_id
) team_count
    ON employee.team_id = team_count.team_id;
