SELECT pe.name
FROM person pe
WHERE pe.gender = 'female'
	AND EXISTS (SELECT 1
				FROM person_order po
				INNER JOIN menu m
					ON m.id = po.menu_id
				WHERE po.person_id = pe.id
					AND m.pizza_name = 'cheese pizza')
	AND EXISTS (SELECT 1
				FROM person_order po
				INNER JOIN menu m
					ON m.id = po.menu_id
				WHERE po.person_id = pe.id
					AND m.pizza_name = 'pepperoni pizza')
ORDER BY pe.name;