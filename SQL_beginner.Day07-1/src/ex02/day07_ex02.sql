WITH action_visits AS ( SELECT pz.name, COUNT(person_id), 'visit' AS action_type
						FROM pizzeria pz JOIN person_visits pv ON pz.id=pv.pizzeria_id
						GROUP BY pz.name
						ORDER BY count DESC
						LIMIT 3),
	 action_order AS ( SELECT pz.name, COUNT(person_id), 'order' AS action_type
					   FROM pizzeria pz JOIN menu m ON m.pizzeria_id=pz.id
					   JOIN person_order po ON m.id=po.menu_id
					   GROUP BY pz.name
					   ORDER BY count DESC
					   LIMIT 3)
					   
SELECT name, count, action_type
FROM action_visits
UNION ALL
SELECT name, count, action_type
FROM action_order
ORDER BY action_type ASC, count DESC;