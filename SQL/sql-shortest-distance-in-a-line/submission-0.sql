-- Write your query below
SELECT MIN(p2.x - p1.x) AS shortest
FROM point p1
INNER JOIN point p2
    ON p1.x < p2.x;
