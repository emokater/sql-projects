WITH dates AS (
	SELECT t1.day::date AS missing_date
	FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS t1(day)
)

SELECT dates.missing_date
FROM dates
LEFT JOIN (
	SELECT DISTINCT visit_date
	FROM person_visits pv
	WHERE person_id BETWEEN 1 AND 2
		AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') AS t
	ON dates.missing_date = t.visit_date
WHERE t.visit_date IS NULL
ORDER BY missing_date