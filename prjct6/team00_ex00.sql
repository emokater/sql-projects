-- CREATE TABLE graph (
-- 	point1 CHAR(1), 
-- 	point2 CHAR(1), 
-- 	cost INT
-- );

-- INSERT INTO graph (point1, point2, cost)
-- VALUES
-- 	('a', 'b', 10), ('a', 'c', 15), ('a', 'd', 20),
-- 	('b', 'a', 10), ('b', 'c', 35), ('b', 'd', 25), 
-- 	('c', 'a', 15), ('c', 'b', 35), ('c', 'd', 30), 
-- 	('d', 'a', 20), ('d', 'b', 25), ('d', 'c', 30);

-- WITH t AS (
-- 	SELECT g1.point1 AS p1, g1.point2 AS p2, g2.point2 AS p3, g3.point2 AS p4, g4.point2 AS p5, g1.cost + g2.cost + g3.cost + g4.cost AS total_cost
-- 	FROM graph g1
-- 	CROSS JOIN graph g2
-- 	CROSS JOIN graph g3
-- 	CROSS JOIN graph g4
-- 	WHERE g1.point2 = g2.point1 AND g2.point2 = g3.point1 AND g3.point2 = g4.point1
-- 		AND g1.point1 != g2.point2 AND g1.point1 != g3.point2
-- 		AND g1.point2 != g3.point2
-- 		AND g1.point1 = g4.point2
-- 		AND g1.point1 = 'a'
-- )

-- SELECT t.total_cost, '{' || array_to_string(ARRAY[t.p1, t.p2, t.p3, t.p4, t.p5], ',') || '}' AS tour
-- FROM t
-- WHERE total_cost = (SELECT MIN(total_cost) FROM t)
-- ORDER BY total_cost, tour

WITH RECURSIVE nodes AS (
    SELECT point1 AS node FROM graph
    UNION
    SELECT point2 FROM graph
),
node_count AS (
    SELECT COUNT(DISTINCT node) AS n FROM nodes
),
paths(start, curr, tour, visited, visited_count, total_cost) AS (
    SELECT
        g.point1 AS start,
        g.point2 AS curr,
        CONCAT(g.point1, ',', g.point2) AS tour,                
        CONCAT(',', g.point1, ',', g.point2, ',') AS visited,   
        2 AS visited_count,
        g.cost AS total_cost
    FROM graph g
    WHERE g.point1 = 'a'

    UNION ALL

    SELECT
        p.start,
        g.point2,
        CONCAT(p.tour, ',', g.point2),
        CONCAT(p.visited, g.point2, ','),
        p.visited_count + 1,
        p.total_cost + g.cost
    FROM paths p
    JOIN graph g ON g.point1 = p.curr
    CROSS JOIN node_count nc
    WHERE p.visited_count < nc.n
        AND POSITION(CONCAT(',', g.point2, ',') IN p.visited) = 0
),

complete AS (
    SELECT
        CONCAT(p.tour, ',', p.start) AS tour,        
        p.total_cost + g.cost AS total_cost
    FROM paths p
    JOIN node_count nc ON p.visited_count = nc.n
    JOIN graph g ON g.point1 = p.curr AND g.point2 = p.start
)

SELECT
    total_cost,
    CONCAT('{', tour, '}') AS tour
FROM complete
WHERE total_cost IN (
    (SELECT MIN(total_cost) FROM complete),
    (SELECT MAX(total_cost) FROM complete)
)
ORDER BY total_cost, tour;


