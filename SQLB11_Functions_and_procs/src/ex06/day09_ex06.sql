CREATE FUNCTION fnc_person_visits_and_eats_on_date(
pperson TEXT DEFAULT 'Dmitriy', 
pprice INTEGER DEFAULT 500,
pdate DATE DEFAULT DATE '2022-01-08')

RETURNS SETOF TEXT AS $$
BEGIN
RETURN QUERY
SELECT DISTINCT pi.name::TEXT
FROM person AS p 
JOIN person_visits AS pv ON p.id = pv.person_id
JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
JOIN menu AS m ON pi.id = m.pizzeria_id
WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;


SELECT *  
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *  
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');