-- Write your query below
WITH ranked AS (
    SELECT
        order_id,
        order_date,
        product_id,
        RANK() OVER (PARTITION BY product_id ORDER BY order_date DESC) AS rnk
    FROM orders
)

SELECT
    p.product_name,
    r.product_id,
    r.order_id,
    r.order_date
FROM ranked r
INNER JOIN products p ON r.product_id = p.product_id
WHERE r.rnk = 1
ORDER BY
    p.product_name ASC,
    r.product_id ASC,
    r.order_id ASC
