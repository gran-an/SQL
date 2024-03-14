SELECT person_name1, person_name2, address_1 AS common_address
FROM (SELECT id AS id_1, name AS person_name1, address AS address_1 FROM person) p_1
JOIN (SELECT id AS id_2, name AS person_name2, address AS address_2 FROM person) p_2
ON p_1.address_1=p_2.address_2
WHERE id_1>id_2;