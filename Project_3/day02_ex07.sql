SELECT pi.name AS pizzeria_name
FROM pizzeria pi
INNER JOIN person_visits pv
	ON pv.pizzeria_id = pi.id
INNER JOIN menu m
	ON m.pizzeria_id = pi.id
WHERE pv.person_id = (
		SELECT id 
		FROM person 
		WHERE name = 'Dmitriy') 
	AND pv.visit_date = '2022-01-08'
	AND m.price < 800;