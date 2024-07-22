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
--   1 | Pizza Hut |      4
-- (1 row)

/*Session #2*/

UPDATE pizzeria SET rating=3.6 WHERE name='Pizza Hut';
-- UPDATE 1

COMMIT WORK;
-- COMMIT

/*Session #1*/

SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

COMMIT WORK;
-- COMMIT

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