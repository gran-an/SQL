WITH go AS (SELECT *
FROM (SELECT person_id, menu_id FROM person_order) po	
JOIN (SELECT id, pizzeria_id FROM menu) m
ON m.id=po.menu_id
JOIN (SELECT id, name AS pizzeria_name FROM pizzeria) pz
ON m.pizzeria_id=pz.id
JOIN (SELECT id, gender FROM person) p
ON p.id=po.person_id)

(SELECT pizzeria_name FROM go WHERE gender='male'
EXCEPT
SELECT pizzeria_name FROM go WHERE gender='female')
UNION
(SELECT pizzeria_name FROM go WHERE gender='female'
EXCEPT
SELECT pizzeria_name FROM go WHERE gender='male')
ORDER BY pizzeria_name;