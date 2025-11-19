WITH t AS (
	(SELECT pz.name, COUNT(po.id) AS count, 'order' AS action_type
	FROM pizzeria pz
	LEFT JOIN menu m ON pz.id = m.pizzeria_id
	LEFT JOIN person_order po ON m.id = po.menu_id
	GROUP BY pz.name)
	UNION
	(SELECT pz.name, COUNT(pv.id) AS count, 'visit' AS action_type
	FROM pizzeria pz
	LEFT JOIN person_visits pv ON pz.id = pv.pizzeria_id
	GROUP BY pz.name)
	ORDER BY 3)

SELECT name, SUM(count) AS total_count
FROM t
GROUP BY name
ORDER BY 2 DESC, 1