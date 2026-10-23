WITH per AS (
  SELECT id, name
  FROM person
  WHERE  gender = 'male' AND address IN ('Moscow', 'Samara')
  )
 SELECT DISTINCT per.name
 FROM per 
 JOIN person_order AS po ON per.id = po.person_id
 Join menu AS me ON po.menu_id = me.id AND me.pizza_name IN ('pepperoni pizza', 'mushroom pizza')

ORDER BY per.name DESC