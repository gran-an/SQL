SELECT name, COUNT(po.person_id) AS count_of_orders, ROUND(AVG(m.price), 2) AS average_price, 
	   MAX(m.price) AS max_price, MIN(m.price) AS min_price
FROM person_order po JOIN menu m ON po.menu_id=m.id
JOIN pizzeria pz ON pz.id=m.pizzeria_id
GROUP BY name
ORDER BY name;