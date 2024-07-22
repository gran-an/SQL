CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson varchar DEFAULT 'Dmitriy',
															  IN pprice numeric DEFAULT 500,
															  IN pdate date DEFAULT '2022-01-08') 
	RETURNS TABLE
        (pizzeria_name varchar) AS $$
	BEGIN
	RETURN QUERY
		SELECT DISTINCT(pz.name)
		FROM person_visits pv JOIN person p ON pv.person_id=p.id
		JOIN pizzeria pz ON pv.pizzeria_id=pz.id
		JOIN menu m ON pz.id=m.pizzeria_id
		WHERE pperson = p.name AND pprice > m.price AND pdate=pv.visit_date;
	END;
	$$ LANGUAGE PLPGSQL;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');