SELECT
    (
     SELECT person.name
     FROM person
     WHERE person.id = person_copy.id
    ) AS NAME,
	CASE
	WHEN (name = 'Denis') THEN true
	ELSE false
	END
	AS check_name
FROM person person_copy
WHERE EXISTS (
    SELECT person_id
    FROM person_order 
    WHERE person_id = person_copy.id
      AND (menu_id = 13 OR menu_id = 14 OR menu_id = 18)
      AND order_date = '2022-01-07'
);