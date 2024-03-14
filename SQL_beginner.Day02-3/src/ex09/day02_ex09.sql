SELECT DISTINCT(person.name) AS name
FROM person
JOIN person_order
ON person.id=person_order.person_id
JOIN menu
ON menu.id=person_order.menu_id
WHERE person.gender='female'
AND (pizza_name='pepperoni pizza' OR pizza_name='cheese pizza')
ORDER BY name;