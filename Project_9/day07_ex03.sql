WITH visits AS (
    SELECT
        pi.name AS name,
        count(*) AS count
    FROM person_visits pv
    INNER JOIN pizzeria pi
        ON pi.id = pv.pizzeria_id
    GROUP BY 1
),
orders AS (
    SELECT
        pi.name AS name,
        count(*) AS count
    FROM person_order po
    INNER JOIN menu m
        ON m.id = po.menu_id
    INNER JOIN pizzeria pi
        ON pi.id = m.pizzeria_id
    GROUP BY 1
)

SELECT v.name, COALESCE(v.count, 0) + COALESCE(o.count, 0) AS total_count
FROM visits v
FULL JOIN orders o
    ON o.name = v.name
ORDER BY 2 DESC, 1;