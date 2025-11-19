(SELECT pz.name, COUNT(po.id) AS count, 'order' AS action_type
FROM pizzeria pz
JOIN menu m ON pz.id = m.pizzeria_id
JOIN person_order po ON m.id = po.menu_id
GROUP BY pz.name
ORDER BY 2 DESC
LIMIT 3)
UNION
(SELECT pz.name, COUNT(pv.id) AS count, 'visit' AS action_type
FROM pizzeria pz
JOIN person_visits pv ON pz.id = pv.pizzeria_id
GROUP BY pz.name
ORDER BY 2 DESC
LIMIT 3)
ORDER BY 3, 2 DESC