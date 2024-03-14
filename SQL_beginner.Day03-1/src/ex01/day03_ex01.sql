SELECT m.id AS menu_id
FROM (SELECT id FROM menu WHERE id NOT IN (SELECT DISTINCT(menu_id) FROM person_order)) m
ORDER BY menu_id;

