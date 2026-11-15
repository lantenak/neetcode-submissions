-- Write your query below
SELECT
    person1,
    person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM (
    SELECT
        CASE
            WHEN from_id < to_id THEN from_id
        ELSE to_id
        END AS person1,
        CASE
            WHEN from_id > to_id THEN from_id
        ELSE to_id
        END AS person2,
        duration
    FROM
        calls
) c
GROUP BY
    person1,
    person2;
