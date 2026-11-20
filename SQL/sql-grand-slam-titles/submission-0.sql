-- Write your query below
WITH cte AS (
    SELECT
        year,
        wimbledon AS player_id
    FROM championships
    UNION ALL
    SELECT
        year,
        fr_open
    FROM
        championships
    UNION ALL
    SELECT
        year,
        us_open
    FROM championships
    UNION ALL
    SELECT
        year,
        au_open
    FROM championships
)

SELECT
    p.player_id,
    p.player_name,
    COUNT(*) AS grand_slams_count
FROM players p
INNER JOIN cte c ON p.player_id = c.player_id
GROUP BY
    p.player_id,
    p.player_name;
