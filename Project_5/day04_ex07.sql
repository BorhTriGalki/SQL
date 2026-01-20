INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (
        SELECT MAX(id) 
        FROM person_visits) + 1
    ,
    (
        SELECT id 
        FROM person 
        WHERE name = 'Dmitriy'
    ),
    (
        SELECT m.pizzeria_id 
        FROM menu m
        INNER JOIN pizzeria pi
            ON pi.id = m.pizzeria_id
        WHERE m.price < 800 
            AND pi.name != 'Papa Johns'
        LIMIT 1
    ),
    '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;