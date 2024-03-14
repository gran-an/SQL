SELECT person.name AS name
FROM person
JOIN person_order
ON person.id=person_order.person_id
JOIN menu
ON menu.id=person_order.menu_id
WHERE person.gender='male' AND (address='Moscow' OR address='Samara') 
AND (pizza_name='pepperoni pizza' OR pizza_name='mushroom pizza')
ORDER BY name DESC;