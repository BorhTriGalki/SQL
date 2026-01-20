SELECT pe.name
FROM person_order po
INNER JOIN person pe
	ON pe.id = po.person_id
INNER JOIN menu m
	ON m.id = po.menu_id
WHERE pe.gender = 'male'
	AND pe.address IN ('Moscow', 'Samara')
	AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY pe.name DESC;