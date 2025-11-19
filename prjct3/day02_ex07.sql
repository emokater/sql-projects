SELECT pz.name as pizzeria_name
FROM pizzeria pz
JOIN person_visits pv ON pz.id = pv.pizzeria_id
JOIN person p ON pv.person_id = person_id
JOIN menu m ON pz.id = m.pizzeria_id
WHERE p.name = 'Denis'
	AND pv.visit_date = '2022-01-08'
	AND m.price < 800