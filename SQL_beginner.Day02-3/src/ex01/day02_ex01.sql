SELECT DISTINCT(date(gen_date)) AS missing_date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') gen_date
LEFT JOIN (SELECT person_id, visit_date FROM person_visits WHERE person_id=1 OR person_id=2) pv
ON gen_date=pv.visit_date
WHERE person_id ISNULL
ORDER BY missing_date;