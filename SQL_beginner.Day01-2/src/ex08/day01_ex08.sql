SELECT order_date, name || ' (age:' || age || ')' AS person_information 
FROM person_order 
NATURAL JOIN person AS po (person_id, name, age, gender, address) 
ORDER BY order_date, person_information;