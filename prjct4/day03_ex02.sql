SELECT m.pizza_name, m.price, pz.name
FROM (
	SELECT m.id AS menu_id
	FROM menu m
	WHERE m.id NOT IN (
		SELECT menu_id
		FROM person_order
	)) AS t 
JOIN menu m ON t.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2