SELECT COALESCE(person.name, '-') AS person_name,
	   visit_date,
	   COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (SELECT person_id, pizzeria_id, visit_date FROM person_visits WHERE visit_date>='2022-01-01' AND visit_date<='2022-01-03') pv
FULL OUTER JOIN person
ON person.id=pv.person_id
FULL OUTER JOIN pizzeria
ON pizzeria.id=pv.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;