(SELECT
    pi.name,
    count(*) AS count,
    'visit' AS action_type
FROM person_visits pv
INNER JOIN pizzeria pi
    ON pi.id = pv.pizzeria_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3
)

UNION

(SELECT
    pi.name,
    count(*) AS count,
    'order' AS action_type
FROM person_order po
INNER JOIN menu m
    ON m.id = po.menu_id
INNER JOIN pizzeria pi
    ON pi.id = m.pizzeria_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3
)
ORDER BY 3, 2 DESC;

