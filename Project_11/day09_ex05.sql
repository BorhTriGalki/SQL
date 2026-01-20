DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar default 'female')
RETURNS TABLE (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
)
LANGUAGE SQL
AS $$
    SELECT
        id,
        name,
        age,
        gender,
        address
    FROM person
    WHERE gender = pgender;
$$;

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();