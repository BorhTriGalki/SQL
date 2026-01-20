CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pi.name AS pizzeria_name
FROM person_visits pv
INNER JOIN pizzeria pi
    ON pi.id = pv.pizzeria_id
INNER JOIN menu m
    ON m.pizzeria_id = pi.id
WHERE person_id = (
    SELECT id 
    FROM person 
    WHERE name = 'Dmitriy'
    )
    AND visit_date = '2022-01-08'
    AND m.price < 800;