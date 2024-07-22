CREATE SEQUENCE seq_person_discounts START 1;
SELECT SETVAL('seq_person_discounts', (SELECT COUNT(*) FROM person_discounts));

ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts'); 
	

-- INSERT INTO person_discounts (person_id, pizzeria_id)
-- VALUES (3, 3);
-- SELECT * FROM person_discounts;