SELECT DISTINCT(name)
FROM person p JOIN person_order po ON p.id=po.person_id
ORDER BY name;