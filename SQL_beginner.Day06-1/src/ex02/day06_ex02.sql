SELECT p.name, pizza_name, price, ROUND(price * (100 - discount) / 100) AS discount_price, pz.name AS pizzeria_name
FROM person p JOIN person_order po ON po.person_id=p.id
JOIN menu m ON po.menu_id=m.id
JOIN pizzeria pz ON pz.id=m.pizzeria_id
JOIN person_discounts pd ON (po.person_id=pd.person_id AND pz.id=pd.pizzeria_id)
ORDER BY p.name, pizza_name;