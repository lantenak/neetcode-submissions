-- Write your query below
SELECT
    o.customer_id,
    c.name
FROM
    orders o
JOIN
    customers c
ON
    o.customer_id = c.customer_id
JOIN
    product p
ON
    o.product_id = p.product_id
WHERE
    o.order_date >= '2020-06-01' 
    AND o.order_date < '2020-08-01'
GROUP BY
    o.customer_id,
    c.name
HAVING
    SUM(CASE WHEN o.order_date >= '2020-06-01' AND o.order_date < '2020-07-01' THEN p.price * o.quantity ELSE 0 END) >= 100
    AND SUM(CASE WHEN o.order_date >= '2020-07-01' AND o.order_date < '2020-08-01' THEN p.price * o.quantity ELSE 0 END) >= 100;
