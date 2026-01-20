SELECT COALESCE(pe.name, '-') AS person_name, 
	   pv.visit_date, 
	   COALESCE(pi.name, '-') AS pizzeria_name
FROM person pe
FULL JOIN (SELECT *
			FROM person_visits
			WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pv
	ON pv.person_id = pe.id
FULL JOIN pizzeria pi
	ON pi.id = pv.pizzeria_id
ORDER BY person_name, pv.visit_date, pizzeria_name;