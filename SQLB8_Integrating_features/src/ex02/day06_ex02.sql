SELECT
  p.name,
  me.pizza_name,
  me.price,
  ROUND(me.price - (me.price * (pd.discount / 100)), 2) AS discount_price,
  pi.name AS pizzeria_name
FROM
  person AS p
  JOIN person_discounts AS pd ON p.id = pd.person_id
  JOIN person_order AS po ON p.id = po.person_id
  JOIN menu AS me ON po.menu_id = me.id
  JOIN pizzeria AS pi ON me.pizzeria_id = pi.id
  AND pd.pizzeria_id = pi.id
ORDER BY
  p.name,
  me.pizza_name;