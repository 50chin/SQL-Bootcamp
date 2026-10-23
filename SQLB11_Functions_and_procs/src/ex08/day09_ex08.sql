
CREATE FUNCTION fnc_fibonacci (pstop INTEGER DEFAULT 10)
RETURNS TABLE ( num INTEGER) AS $$ 
DECLARE 
a INTEGER := 0; 
b INTEGER := 1; 
BEGIN
WHILE a < pstop LOOP
num := a;
RETURN NEXT;
num := a + b;
a := b;
b := num;
END LOOP;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();