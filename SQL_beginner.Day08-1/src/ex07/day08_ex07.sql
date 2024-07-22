/*Session #1*/

BEGIN;
-- BEGIN

/*Session #2*/

BEGIN;
-- BEGIN

/*Session #1*/

UPDATE pizzeria SET rating=4 WHERE id=1;
-- UPDATE 1

/*Session #2*/

UPDATE pizzeria SET rating=3 WHERE id=2;
-- UPDATE 1

/*Session #1*/

UPDATE pizzeria SET rating=4 WHERE id=2;
-- UPDATE 1

/*Session #2*/

UPDATE pizzeria SET rating=3 WHERE id=1;
-- ERROR:  deadlock detected
-- DETAIL:  Process 32005 waits for ShareLock on transaction 980; blocked by process 31967.
-- Process 31967 waits for ShareLock on transaction 981; blocked by process 32005.
-- HINT:  See server log for query details.
-- CONTEXT:  while updating tuple (0,14) in relation "pizzeria"

/*Session #1*/

COMMIT WORK;
-- COMMIT

/*Session #2*/

COMMIT WORK;
-- ROLLBACK