SELECT DISTINCT pe.name
FROM person_order po
INNER JOIN person pe
    ON pe.id = po.person_id
ORDER BY 1;