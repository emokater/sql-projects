SELECT t.name
FROM (
	SELECT p.name AS name, COUNT(po.person_id) AS cnt
	FROM person p
	JOIN person_order po ON p.id = po.person_id
	JOIN menu m ON po.menu_id = m.id
	WHERE p.gender = 'female'
		AND m.pizza_name IN ('cheese pizza', 'pepperoni pizza')
	GROUP BY p.name) AS t
WHERE t.cnt = 2
ORDER BY 1