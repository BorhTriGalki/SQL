SELECT pe.name, count(*) AS count_of_visits
FROM person_visits pv
INNER JOIN person pe
    ON pe.id = pv.person_id
GROUP BY pe.name
HAVING count(*) > 3;