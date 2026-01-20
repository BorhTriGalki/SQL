SELECT m.pizza_name, m.price, pi.name
FROM menu m
INNER JOIN pizzeria pi
    ON pi.id = m.pizzeria_id
WHERE m.id NOT IN (SELECT menu_id
                    FROM person_order)
ORDER BY 1, 2;