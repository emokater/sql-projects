CREATE VIEW v_price_with_discount AS
SELECT p.name AS person_name, 
	m.pizza_name, 
	m.price AS real_price, 
	ROUND(m.price*0.9) AS discount_price
FROM person p
JOIN person_order po ON p.id = po.person_id
JOIN menu m ON po.menu_id = m.id
ORDER BY 1,2