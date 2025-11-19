SELECT object_name
FROM
	(SELECT pizza_name AS object_name, 'menu' AS flag
	FROM menu
	UNION ALL
	SELECT name AS object_name, 'person' AS flag
	FROM person
	ORDER BY flag DESC, object_name) as t