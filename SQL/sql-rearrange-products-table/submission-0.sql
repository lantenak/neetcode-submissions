-- Write your query below
SELECT
    p1.product_id AS product_id,
    'store1' AS store,
    p1.store1 AS price
FROM products AS p1
WHERE p1.store1 IS NOT NULL
UNION ALL
SELECT
    p2.product_id AS product_id,
    'store2' AS store,
    p2.store2 AS price
FROM products AS p2
WHERE p2.store2 IS NOT NULL
UNION ALL
SELECT
    p3.product_id AS product_id,
    'store3' AS store,
    p3.store3 AS price
FROM products AS p3
WHERE p3.store3 IS NOT NULL;
