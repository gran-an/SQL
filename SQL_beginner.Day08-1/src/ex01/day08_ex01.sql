/*Session #1*/

BEGIN;
-- BEGIN

/*Session #2*/

BEGIN;
-- BEGIN

/*Session #1*/

SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)

/*Session #2*/

SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)

/*Session #1*/

UPDATE pizzeria SET rating=4 WHERE name='Pizza Hut';
-- UPDATE 1

/*Session #2*/

UPDATE pizzeria SET rating=3.6 WHERE name='Pizza Hut';
-- UPDATE 1

/*Session #1*/

COMMIT WORK;
-- COMMIT

/*Session #2*/

COMMIT WORK;
-- COMMIT

/*Session #1*/

SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

/*Session #2*/

SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)