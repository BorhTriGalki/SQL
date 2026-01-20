SELECT m.pizza_name, pi.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria pi
    ON pi.id = m.pizzeria_id;

SET enable_seqscan = OFF;

EXPLAIN ANALYZE 
SELECT m.pizza_name, pi.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria pi
    ON pi.id = m.pizzeria_id;

SET enable_seqscan = ON;