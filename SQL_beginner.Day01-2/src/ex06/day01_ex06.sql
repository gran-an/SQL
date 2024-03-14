SELECT order_date AS action_date, (SELECT person.name FROM person WHERE person.id=po.person_id) AS person_name
FROM person_order po
INTERSECT
SELECT visit_date AS action_date, (SELECT person.name FROM person WHERE person.id=pv.person_id) AS person_name 
FROM person_visits pv
ORDER BY action_date, person_name DESC;