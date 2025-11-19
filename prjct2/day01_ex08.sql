SELECT po.order_date, p.name || ' (age:'||age||')' AS person_information
FROM person_order po
NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS p
ORDER BY 1, 2