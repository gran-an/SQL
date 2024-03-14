SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM (SELECT pizzeria_id, visit_date FROM person_visits WHERE person_id IN (SELECT id FROM person WHERE name='Kate')) pv
JOIN pizzeria 
ON pv.pizzeria_id=pizzeria.id
JOIN menu
ON pizzeria.id=menu.pizzeria_id
WHERE price>=800 AND price<=1000
ORDER BY pizza_name, price, pizzeria_name;

