SELECT
  p.address,
  pi.name,
  COUNT(*) AS count_of_orders
FROM
  person AS p
  JOIN person_order AS po ON p.id = po.person_id
  JOIN menu AS m ON po.menu_id = m.id
  JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
GROUP BY
  p.address,
  pi.name
ORDER BY
  p.address,
  pi.name