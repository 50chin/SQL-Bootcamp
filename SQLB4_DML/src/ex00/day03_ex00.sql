WITH
  per AS (
    SELECT
      id,
      name
    FROM
      person
    WHERE
      name = 'Kate'
  )
SELECT
  me.pizza_name,
  me.price,
  pi.name AS pizzeria_name,
  pv.visit_date
FROM
  per
  JOIN person_visits AS pv ON per.id = pv.person_id
  JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
  JOIN menu AS me ON pi.id = me.pizzeria_id
  AND me.price BETWEEN 800 AND 1000
ORDER BY
  me.pizza_name,
  me.price,
  pizzeria_name