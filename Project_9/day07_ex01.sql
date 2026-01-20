SELECT pe.name, count(*) AS count_of_visits
FROM person_visits pv
INNER JOIN person pe
    ON pe.id = pv.person_id
GROUP BY 1
ORDER BY 2 DESC, 1
LIMIT 4;