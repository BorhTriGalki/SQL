(SELECT pi.name AS pizzeria_name
FROM pizzeria pi
INNER JOIN person_visits pv
    ON pv.pizzeria_id = pi.id
INNER JOIN person pe
    ON pe.id = pv.person_id
WHERE pe.gender = 'female'

EXCEPT ALL

SELECT pi.name 
FROM pizzeria pi
INNER JOIN person_visits pv
    ON pv.pizzeria_id = pi.id
INNER JOIN person pe
    ON pe.id = pv.person_id
WHERE pe.gender = 'male')

UNION ALL

(SELECT pi.name AS pizzeria_name
FROM pizzeria pi
INNER JOIN person_visits pv
    ON pv.pizzeria_id = pi.id
INNER JOIN person pe
    ON pe.id = pv.person_id
WHERE pe.gender = 'male'

EXCEPT ALL

SELECT pi.name
FROM pizzeria pi
INNER JOIN person_visits pv
    ON pv.pizzeria_id = pi.id
INNER JOIN person pe
    ON pe.id = pv.person_id
WHERE pe.gender = 'female')
ORDER BY 1;

