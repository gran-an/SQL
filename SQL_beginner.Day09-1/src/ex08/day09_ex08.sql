CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) 
	RETURNS TABLE(fib_numb	integer) AS $$
	WITH RECURSIVE fib_number AS (
	SELECT 0 AS current_numb, 1 AS future_numb
	UNION ALL
	SELECT future_numb AS current_numb, current_numb + future_numb AS future_numb
	FROM fib_number
	WHERE future_numb < pstop)
	SELECT current_numb FROM fib_number;
	$$ LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
