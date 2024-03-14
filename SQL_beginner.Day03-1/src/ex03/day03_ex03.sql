WITH go AS (SELECT *
FROM (SELECT id, name AS pizzeria_name FROM pizzeria) pz
JOIN (SELECT person_id, pizzeria_id FROM person_visits) pv
ON pz.id=pv.pizzeria_id
JOIN (SELECT id, gender FROM person) p
ON p.id=pv.person_id)

(SELECT pizzeria_name FROM go WHERE gender='male'
EXCEPT ALL
SELECT pizzeria_name FROM go WHERE gender='female')
UNION ALL 
(SELECT pizzeria_name FROM go WHERE gender='female'
EXCEPT ALL
SELECT pizzeria_name FROM go WHERE gender='male')
ORDER BY pizzeria_name;