

CREATE TABLE nodes
(
    point1 CHAR(1) NOT NULL,
    point2 CHAR(1) NOT NULL,
    cost INTEGER NOT NULL
);

INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('a', 'd', 20),
       ('b', 'a', 10),
       ('b', 'c', 35),
       ('b', 'd', 25),
       ('c', 'a', 15),
       ('c', 'b', 35),
       ('c', 'd', 30),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);
CREATE VIEW tour_with_min_cost AS(
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
	WHERE cost = (SELECT MIN(cost) FROM all_tours WHERE array_length(tour, 1) = 4 AND last_point = 'a')
	AND
	array_length(tour, 1) = 4
	AND
	last_point = 'a'
	ORDER BY total_cost, tour
	);
SELECT * FROM tour_with_min_cost
