/*Session #1*/

BEGIN;
-- BEGIN

/*Session #2*/

BEGIN;
-- BEGIN

/*Session #1*/

SELECT SUM(rating) FROM pizzeria;
--  sum  
-- ------
--  21.9
-- (1 row)

/*Session #2*/

UPDATE pizzeria SET rating=1 WHERE name='Pizza Hut';
-- UPDATE 1

COMMIT WORK;
-- COMMIT

/*Session #1*/

SELECT SUM(rating) FROM pizzeria;
--  sum  
-- ------
--  19.9
-- (1 row)

COMMIT WORK;
-- COMMIT

SELECT SUM(rating) FROM pizzeria;
--  sum  
-- ------
--  19.9
-- (1 row)

/*Session #2*/

SELECT SUM(rating) FROM pizzeria;
--  sum  
-- ------
--  19.9
-- (1 row)