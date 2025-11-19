SELECT *
FROM person pn
CROSS JOIN pizzeria pz
ORDER BY pn.id, pz.id