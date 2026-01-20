CREATE VIEW tours_all_cityes AS(
	WITH RECURSIVE all_tours AS (
		SELECT array[point1]::bpchar[] AS tour, point2 AS last_point, cost 
		FROM nodes n 
		WHERE point1 = 'a'
		UNION
		SELECT a.tour || a.last_point, n.point2, a.cost + n.cost 
		FROM all_tours a INNER JOIN nodes n 
		ON a.last_point = n.point1
		WHERE array_position(a.tour, a.last_point) IS NULL
	)

	SELECT cost AS total_cost, tour || last_point AS tour
	FROM all_tours 
	WHERE
	array_length(tour, 1) = 4
	AND
	last_point = 'a'
	ORDER BY total_cost, tour
	);
select * from tours_all_cityes