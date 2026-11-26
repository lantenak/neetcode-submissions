-- Write your query below
WITH recent_orders AS (
    SELECT
        order_id,
        order_date,
        customer_id,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM orders
)

SELECT
    c.name AS customer_name,
    ro.customer_id AS customer_id,
    ro.order_id,
    ro.order_date AS order_date
FROM recent_orders ro
INNER JOIN customers c ON ro.customer_id = c.customer_id
WHERE rn <= 3
ORDER BY
    customer_name ASC,
    customer_id ASC,
    order_date DESC;
