WITH go AS (SELECT *
	FROM (SELECT id, name AS pizzeria_name FROM pizzeria) pz
	JOIN (SELECT person_id, pizzeria_id FROM person_visits) pv
	ON pz.id=pv.pizzeria_id
	JOIN (SELECT id FROM person WHERE name='Andrey') p
	ON p.id=pv.person_id), 
	
	gv AS (SELECT *
	FROM (SELECT person_id, menu_id FROM person_order) po	
	JOIN (SELECT id, pizzeria_id FROM menu) m
	ON m.id=po.menu_id
	JOIN (SELECT id, name AS pizzeria_name FROM pizzeria) pz
	ON m.pizzeria_id=pz.id
	JOIN (SELECT id FROM person WHERE name='Andrey') p
	ON p.id=po.person_id)
SELECT pizzeria_name FROM go
EXCEPT
SELECT pizzeria_name FROM gv
ORDER BY pizzeria_name;