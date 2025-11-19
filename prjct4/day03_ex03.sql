(SELECT pz.name AS pizzeria_name
FROM person_visits pv
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
JOIN person p ON pv.person_id = p.id
WHERE p.gender = 'female'
EXCEPT ALL
SELECT pz.name AS pizzeria_name
FROM person_visits pv
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
JOIN person p ON pv.person_id = p.id
WHERE p.gender = 'male')
UNION ALL
(SELECT pz.name AS pizzeria_name
FROM person_visits pv
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
JOIN person p ON pv.person_id = p.id
WHERE p.gender = 'male'
EXCEPT ALL
SELECT pz.name AS pizzeria_name
FROM person_visits pv
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
JOIN person p ON pv.person_id = p.id
WHERE p.gender = 'female')
ORDER BY 1