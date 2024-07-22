SELECT name, COUNT(pizzeria_id) AS count_of_visits
FROM person_visits pv JOIN person p ON p.id=pv.person_id
GROUP BY name HAVING COUNT(pizzeria_id) > 3;