CREATE VIEW v_symmetric_union AS 
WITH PV02 AS (SELECT person_id
			  FROM person_visits
			  WHERE visit_date<='2022-01-02'),
	 PV06 AS (SELECT person_id
			  FROM person_visits
			  WHERE visit_date<='2022-01-06')
(SELECT * FROM PV02 EXCEPT SELECT * FROM PV06)
UNION
(SELECT * FROM PV06 EXCEPT SELECT * FROM PV02)
ORDER BY person_id;