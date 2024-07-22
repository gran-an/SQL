/*Session #1*/

BEGIN;

UPDATE pizzeria SET rating=5 WHERE name='Pizza Hut';
-- UPDATE 1;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)

/*Session #2*/

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |    4.6
-- (1 row)

/*Session #1*/

COMMIT WORK;
-- COMMIT

/*Session #2*/

SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)