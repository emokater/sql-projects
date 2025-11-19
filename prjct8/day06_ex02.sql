SELECT p.name, 
	m.pizza_name,
	m.price, 
	ROUND(m.price * (100 - pd.discount) / 100) AS discount_price,
	pz.name AS pizzeria_name
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN person_discounts pd ON p.id = pd.person_id
JOIN pizzeria pz ON pd.pizzeria_id = pz.id
ORDER BY 1,2;