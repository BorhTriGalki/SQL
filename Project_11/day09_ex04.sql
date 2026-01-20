CREATE OR REPLACE FUNCTION fnc_persons_female()
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
    WHERE gender = 'female';
$$;

CREATE OR REPLACE FUNCTION fnc_persons_male()
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
    WHERE gender = 'male';
$$;

SELECT *
FROM fnc_persons_female();

SELECT *
FROM fnc_persons_male();