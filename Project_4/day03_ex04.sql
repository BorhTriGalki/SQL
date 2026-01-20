(SELECT pi.name
FROM pizzeria pi
INNER JOIN menu m
    ON m.pizzeria_id = pi.id
INNER JOIN person_order po
    ON po.menu_id = m.id
INNER JOIN person pe
    ON pe.id = po.person_id
WHERE pe.gender = 'female'

EXCEPT

SELECT pi.name
FROM pizzeria pi
INNER JOIN menu m
    ON m.pizzeria_id = pi.id
INNER JOIN person_order po
    ON po.menu_id = m.id
INNER JOIN person pe
    ON pe.id = po.person_id
WHERE pe.gender = 'male')

UNION

(SELECT pi.name
FROM pizzeria pi
INNER JOIN menu m
    ON m.pizzeria_id = pi.id
INNER JOIN person_order po
    ON po.menu_id = m.id
INNER JOIN person pe
    ON pe.id = po.person_id
WHERE pe.gender = 'male'

EXCEPT

SELECT pi.name
FROM pizzeria pi
INNER JOIN menu m
    ON m.pizzeria_id = pi.id
INNER JOIN person_order po
    ON po.menu_id = m.id
INNER JOIN person pe
    ON pe.id = po.person_id
WHERE pe.gender = 'female')
ORDER BY 1;