-- Write your query below
WITH max_transactions AS (
    SELECT
        DATE(day) AS dt,
        MAX(amount) AS amt
    FROM transactions
    GROUP BY DATE(day)
)

SELECT t.transaction_id AS transaction_id
FROM transactions t
INNER JOIN max_transactions mt
    ON DATE(t.day) = mt.dt
    AND t.amount = mt.amt
ORDER BY transaction_id ASC;
