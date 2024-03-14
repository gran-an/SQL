WITH pe AS (SELECT pizza_name, pizzeria.name AS pizzeria_name, price, pizzeria_id
		   FROM menu
		   JOIN pizzeria
		   ON menu.pizzeria_id=pizzeria.id)

SELECT p1.pizza_name, p1.pizzeria_name AS pizzeria_name_1, p2.pizzeria_name AS pizzeria_name_2, p1.price
FROM (SELECT * FROM pe) p1
JOIN (SELECT * FROM pe) p2
ON p1.pizza_name=p2.pizza_name AND p1.price=p2.price
WHERE p1.pizzeria_id > p2.pizzeria_id
ORDER BY p1.pizza_name;