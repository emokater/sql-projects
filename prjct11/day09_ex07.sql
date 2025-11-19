-- CREATE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
-- RETURNS NUMERIC
-- LANGUAGE SQL
-- AS $$
-- 	SELECT MIN(i) 
-- 	FROM unnest(arr) AS i;
-- $$;

SELECT *
FROM func_minimum(VARIADIC arr=>ARRAY[10.0, -1.0, 5.0, 4.4])