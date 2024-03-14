INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES((SELECT MAX(id) FROM person_visits) + 1, 
	   (SELECT id FROM person WHERE name='Dmitriy'),
	   (SELECT p.id FROM menu m
   		JOIN pizzeria p ON p.id=m.pizzeria_id
    	WHERE price < 800 AND p.name <> 'Papa Johns'
    	LIMIT 1),
	   '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

