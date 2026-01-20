SELECT pi.name
FROM pizzeria pi
INNER JOIN person_visits pv
    ON pv.pizzeria_id = pi.id
INNER JOIN person pe
    ON pe.id = pv.person_id
WHERE pe.name = 'Andrey'

EXCEPT

SELECT pi.name
FROM pizzeria pi
INNER JOIN menu m
    ON m.pizzeria_id = pi.id
INNER JOIN person_order po
    ON po.menu_id = m.id
INNER JOIN person pe
    ON pe.id = po.person_id
WHERE pe.name = 'Andrey'