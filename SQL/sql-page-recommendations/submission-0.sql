-- Write your query below
WITH friends AS (
    SELECT
        CASE
            WHEN user1_id = 1 THEN user2_id
            WHEN user2_id = 1 THEN user1_id
        END AS friend_id
    FROM friendship
    WHERE
        user1_id = 1
        OR user2_id = 1
)

SELECT DISTINCT page_id AS recommended_page
FROM likes
WHERE
    page_id NOT IN (
        SELECT page_id FROM likes WHERE user_id = 1
    )
    AND user_id IN (
        SELECT friend_id FROM friends
    );
