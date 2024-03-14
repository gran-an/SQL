SELECT name, (CASE WHEN name='Denis'
   				THEN true WHEN name!='Denis'
  				THEN false END) AS check_name 
FROM person p, (SELECT DISTINCT(person_id) 
				FROM person_order
				WHERE (menu_id=13 OR menu_id=14 OR menu_id=18) AND order_date='2022-01-07'
				) po
WHERE p.id=po.person_id;