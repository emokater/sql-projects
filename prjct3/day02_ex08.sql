SELECT p.name
FROM person p
JOIN person_order po ON p.id = po.person_id
JOIN menu m ON po.menu_id = m.id
WHERE p.gender = 'male'
	AND p.address IN ('Moscow', 'Samara')
	AND m.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1 DESC