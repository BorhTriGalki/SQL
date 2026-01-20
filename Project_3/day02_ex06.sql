SELECT m.pizza_name, pi.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria pi
	ON pi.id = m.pizzeria_id
INNER JOIN person_order po
	ON po.menu_id = m.id
WHERE po.person_id IN (SELECT id FROM person WHERE name = 'Denis' OR name = 'Anna')
ORDER BY pizza_name, pizzeria_name;