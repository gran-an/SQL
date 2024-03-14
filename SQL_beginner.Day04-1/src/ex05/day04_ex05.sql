CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, (price - price*0.1)::integer AS discount_price
FROM person_order po 
JOIN (SELECT id, name FROM person) p ON po.person_id=p.id
JOIN menu m ON m.id=po.menu_id
ORDER BY name, pizza_name;