SELECT m.pizza_name, m.price, pi.name, pv.visit_date
FROM pizzeria pi
INNER JOIN person_visits pv
    ON pv.pizzeria_id = pi.id
INNER JOIN menu m
    ON m.pizzeria_id = pi.id
WHERE pv.person_id = (SELECT id 
                    FROM person 
                    WHERE name = 'Kate')
    AND (m.price BETWEEN 800 AND 1000)
ORDER BY 1, 2, 3;