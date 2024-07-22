create table nodes
( point1 varchar not null,
  point2 varchar not null,
  cost integer not null
  );
  
insert into nodes values ('a', 'b', 10),
						 ('a', 'c', 15),
						 ('a', 'd', 20),
						 ('b', 'c', 35),
						 ('b', 'd', 25),
						 ('c', 'd', 30),
						 ('b', 'a', 10),
						 ('c', 'a', 15),
						 ('d', 'a', 20),
						 ('c', 'b', 35),
						 ('d', 'b', 25),
						 ('d', 'c', 30);

WITH RECURSIVE pp(last_point, tour) AS 
	(SELECT point1, ARRAY[point1]::char(1)[], 0 AS cost
	FROM nodes
	WHERE point1 = 'a'
	UNION
	SELECT nodes.point2 AS last_point,
		   (pp.tour || ARRAY[nodes.point2])::char(1)[] AS tour,
		   pp.cost + nodes.cost
	FROM nodes, pp
	WHERE nodes.point1 = pp.last_point AND NOT (nodes.point2 = ANY(pp.tour))), 

result_path AS (
	SELECT
		array_append(tour, 'a') AS tour,
		cost + (SELECT cost FROM nodes WHERE point1 = pp.last_point AND point2 = 'a') as cost
	FROM pp
	WHERE (SELECT array_length(pp.tour, 1)) = 4
)

SELECT cost AS total_cost, tour
FROM result_path
WHERE cost = (SELECT MIN(cost) FROM result_path)
ORDER BY total_cost, tour;