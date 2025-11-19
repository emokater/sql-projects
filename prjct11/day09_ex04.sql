-- CREATE FUNCTION fnc_persons_female()
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
--     WHERE gender = 'female';
-- $$;


-- CREATE FUNCTION fnc_persons_male()
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
--     WHERE gender = 'male';
-- $$;

-- SELECT *
-- FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();