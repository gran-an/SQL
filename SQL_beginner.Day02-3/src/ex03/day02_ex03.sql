WITH gen_date AS (SELECT * FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'))

SELECT DISTINCT(date(generate_series)) AS missing_date
FROM gen_date
LEFT JOIN (SELECT person_id, visit_date FROM person_visits WHERE person_id=1 OR person_id=2) pv
ON gen_date.generate_series=pv.visit_date
WHERE person_id ISNULL
ORDER BY missing_date;