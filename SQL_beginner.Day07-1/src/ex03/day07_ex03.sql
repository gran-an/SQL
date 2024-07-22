WITH visits_and_orders AS ( SELECT pz.name, COUNT(person_id) AS total_count
						FROM pizzeria pz JOIN person_visits pv ON pz.id=pv.pizzeria_id
						GROUP BY pz.name
						UNION ALL
					    SELECT pz.name, COUNT(person_id) AS total_count
					    FROM pizzeria pz JOIN menu m ON m.pizzeria_id=pz.id
					    JOIN person_order po ON m.id=po.menu_id
					    GROUP BY pz.name
					    )
SELECT name, sum(total_count) AS total_count
FROM visits_and_orders
GROUP BY name
ORDER BY total_count DESC, name ASC;