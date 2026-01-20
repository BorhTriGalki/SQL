SELECT m1.pizza_name, 
    pi1.name AS pizzeria_name_1, 
    pi2.name AS pizzeria_name_2, 
    m1.price
FROM menu m1
INNER JOIN menu m2
    ON m1.price = m2.price
    AND m1.pizza_name = m2.pizza_name
    AND m1.pizzeria_id > m2.pizzeria_id
INNER JOIN pizzeria pi1
    ON pi1.id = m1.pizzeria_id
INNER JOIN pizzeria pi2
    ON pi2.id = m2.pizzeria_id
ORDER BY 1;