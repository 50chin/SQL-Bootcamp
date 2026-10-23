WITH per AS (
  SELECT ID, name
  FROM person
  WHERE gender = 'female'
 )
  SELECT per.name
  FROM per
  JOIN person_order AS po ON per.id = po.person_id
  JOIN menu AS me ON po.menu_id = me.id 
  AND me.pizza_name 
  IN ( 'pepperoni pizza', 'cheese pizza' )

  GROUP BY per.name
  HAVING COUNT ( DISTINCT me.pizza_name ) = 2
  ORDER BY per.name