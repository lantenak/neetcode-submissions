-- Write your query below
SELECT
    t.team_id,
    t.team_name,
    COALESCE(SUM(m.num_points), 0) AS num_points
FROM
    teams t
LEFT JOIN (
    SELECT
        host_team AS team_id,
        SUM(CASE 
                WHEN host_goals > guest_goals THEN 3
                WHEN host_goals = guest_goals THEN 1
            ELSE 0
            END) AS num_points
    FROM
        matches
    GROUP BY
        host_team
    UNION ALL
    SELECT
        guest_team,
        SUM(CASE 
                WHEN guest_goals > host_goals THEN 3
                WHEN guest_goals = host_goals THEN 1
            ELSE 0
            END)
    FROM
        matches
    GROUP BY
        guest_team
) m
ON 
    t.team_id = m.team_id
GROUP BY
    t.team_id,
    t.team_name
ORDER BY
    COALESCE(SUM(m.num_points), 0) DESC,
    t.team_id ASC;