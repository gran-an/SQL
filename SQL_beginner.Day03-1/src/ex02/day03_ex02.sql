SELECT pizza_name, price, pizzeria_name
FROM (SELECT pizza_name, 
	 price, 
	 (SELECT name FROM pizzeria WHERE pizzeria.id=m.pizzeria_id) AS pizzeria_name
	 FROM menu m 
	 WHERE id NOT IN (SELECT DISTINCT(menu_id) FROM person_order)) p
ORDER BY pizza_name, price;

