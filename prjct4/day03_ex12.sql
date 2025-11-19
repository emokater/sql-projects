-- WITH new_t AS (
-- 	SELECT person_id 
-- 	FROM person_order 
-- 	WHERE date = '2022-02-25'
-- )

-- INSERT INTO person_order (id, person_id, menu_id, order_date)
-- SELECT generate_series(SELECT MAX(id)+1 FROM person_id, (SELECT MAX(id)+1 FROM person_id) + COUNT(new_t.person_id), 1), new_t.person_id, (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), '2022-02-25'

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT i+(SELECT MAX(id) FROM person_order) AS id,
	id AS person_id,
	(SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
	'2022-02-25' AS order_date
FROM person 
JOIN generate_series(1,(SELECT COUNT(*) FROM person)) AS i ON i = person.id