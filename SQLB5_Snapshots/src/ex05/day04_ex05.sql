CREATE VIEW
  v_price_with_discount AS
SELECT
  per.name,
  me.pizza_name,
  me.price,
  CAST(price - price * 0.1 AS INTEGER) AS discount_price
FROM
  person AS per
  JOIN person_order AS po ON per.id = po.person_id
  JOIN menu AS me ON po.menu_id = me.id
ORDER BY
  name,
  pizza_name,
  discount_price