WITH per_name AS (
  SELECT id, name
  FROM person
  WHERE NAME IN ('Denis','Anna')
) 

SELECT pizza_name, pi.name AS pizzeria_name
FROM per_name 
JOIN person_order AS po ON per_name.id = po.person_id
JOIN menu AS me ON me.id = po.menu_id 
JOIN pizzeria AS pi ON me.pizzeria_id = pi.id

ORDER BY pizza_name, pizzeria_name
