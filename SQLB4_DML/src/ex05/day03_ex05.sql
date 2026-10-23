SELECT
  pi.name AS pizzeria_name
FROM
  person AS per
  JOIN person_visits AS pv ON per.id = pv.person_id
  JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
WHERE
  per.name = 'Andrey'
EXCEPT
SELECT
  pi.name AS pizzeria_name
FROM
  person AS per
  JOIN person_order AS po ON per.id = po.person_id
  JOIN menu AS me ON po.menu_id = me.id
  JOIN pizzeria AS pi ON me.pizzeria_id = pi.id
WHERE
  per.name = 'Andrey'
ORDER BY
  pizzeria_name