-- DROP FUNCTION fnc_persons_female();
-- DROP FUNCTION fnc_persons_male();

-- CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
-- RETURNS TABLE (
-- 	id BIGINT,
--     name VARCHAR,
--     age integer,
--     gender VARCHAR,
--     address VARCHAR
-- )
-- LANGUAGE sql
-- AS $$
-- 	SELECT id, name, age, gender, address
--     FROM person
--     WHERE gender = pgender;
-- $$;

SELECT *
FROM fnc_persons()