CREATE FUNCTION fnc_persons(pgender TEXT DEFAULT 'female')
RETURNS SETOF person AS $$
SELECT * 
FROM person
WHERE gender = pgender;
$$ LANGUAGE SQL;

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();