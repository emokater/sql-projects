SELECT m.pizza_name AS pizza_name, pz1.name AS pizzeria_name_1, pz2.pizzeria_name_2, m.price
FROM menu m
JOIN pizzeria pz1 ON m.pizzeria_id = pz1.id
JOIN (
	SELECT m.pizza_name, pz.name AS pizzeria_name_2, m.price, pz.id
	FROM menu m
	JOIN pizzeria pz ON m.pizzeria_id = pz.id
) AS pz2 ON m.pizza_name = pz2.pizza_name
WHERE m.price = pz2.price 
	AND pz1.id > pz2.id
ORDER BY 1