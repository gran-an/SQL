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
ORDER BY total_cost, tour;