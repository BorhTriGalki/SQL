CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar default 'Dmitriy',
    IN pprice numeric default 500,
    IN pdate date default '2022-01-08'
)
RETURNS TABLE (pizzeria_name varchar)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT pi.name
    FROM pizzeria pi
    INNER JOIN menu m
        ON m.pizzeria_id = pi.id
    INNER JOIN person_visits pv
        ON pv.pizzeria_id = pi.id
    INNER JOIN person pe
        ON pe.id = pv.person_id
    WHERE pe.name = pperson
        AND m.price < pprice
        AND pv.visit_date = pdate;
END;
$$;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');