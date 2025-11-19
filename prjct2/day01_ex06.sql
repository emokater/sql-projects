SELECT po.order_date AS action_date, p.name AS person_name
FROM  person_order po
JOIN person p ON po.person_id = p.id
INTERSECT ALL
SELECT visit_date AS action_date, p.name AS person_name
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
ORDER BY 1 ASC, 2 DESC