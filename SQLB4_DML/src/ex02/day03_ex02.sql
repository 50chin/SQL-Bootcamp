SELECT
  me.pizza_name,
  me.price,
  pi.name AS pizzeria_name
FROM
  menu AS me
  LEFT JOIN person_order AS po ON po.menu_id = me.id
  JOIN pizzeria AS pi ON me.pizzeria_id = pi.id
WHERE
  po.menu_id IS NULL
ORDER BY
  me.pizza_name,
  me.price