SELECT
  me.pizza_name,
   pi2.name AS pizzeria_name_1,
  pi1.name AS pizzeria_name_2,
 
  me.price
FROM
  menu AS me
  JOIN pizzeria AS pi1 ON me.pizzeria_id = pi1.id
  JOIN pizzeria AS pi2 ON pi1.id < pi2.id
  JOIN menu AS me2 ON me2.pizzeria_id = pi2.id
WHERE
  me.pizza_name = me2.pizza_name
  AND me.price = me2.price
ORDER BY
  me.pizza_name