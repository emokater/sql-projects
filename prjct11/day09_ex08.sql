-- CREATE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
-- RETURNS TABLE (
-- 	 fibonacci INTEGER
-- )
-- LANGUAGE SQL
-- AS $$
-- 	 WITH RECURSIVE fib(a, b) AS (
-- 	      SELECT 0 AS a, 1 AS b
-- 	      UNION ALL
-- 	      SELECT b, a + b
-- 	      FROM fib
-- 	      WHERE b < pstop
-- 	  )
	  
-- 	  SELECT a AS fibonacci
-- 	  FROM fib
-- 	  WHERE a < pstop;          
-- $$;

SELECT *
FROM fnc_fibonacci(pstop:=20)