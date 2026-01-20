SELECT 
    pe.address,
    pi.name,
    count(*) AS count_of_orders
FROM person_order po
INNER JOIN person pe
    ON pe.id = po.person_id
INNER JOIN menu m
    ON m.id = po.menu_id
INNER JOIN pizzeria pi
    ON pi.id = m.pizzeria_id
GROUP BY 1, 2
ORDER BY 1, 2;