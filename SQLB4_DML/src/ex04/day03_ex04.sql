(
  SELECT
    pi.name AS pizzeria_name
  FROM
    person AS per
    JOIN person_order AS po ON per.id = po.person_id
    JOIN menu AS me ON po.menu_id = me.id
    JOIN pizzeria AS pi ON me.pizzeria_id = pi.id
  WHERE
    per.gender = 'female'
  EXCEPT
  SELECT
    pi.name AS pizzeria_name
  FROM
    person AS per
    JOIN person_order AS po ON per.id = po.person_id
    JOIN menu AS me ON po.menu_id = me.id
    JOIN pizzeria AS pi ON me.pizzeria_id = pi.id
  WHERE
    per.gender = 'male'
)
UNION
(
  SELECT
    pi.name AS pizzeria_name
  FROM
    person AS per
    JOIN person_order AS po ON per.id = po.person_id
    JOIN menu AS me ON po.menu_id = me.id
    JOIN pizzeria AS pi ON me.pizzeria_id = pi.id
  WHERE
    per.gender = 'male'
  EXCEPT
  SELECT
    pi.name AS pizzeria_name
  FROM
    person AS per
    JOIN person_order AS po ON per.id = po.person_id
    JOIN menu AS me ON po.menu_id = me.id
    JOIN pizzeria AS pi ON me.pizzeria_id = pi.id
  WHERE
    per.gender = 'female'
)
ORDER BY
  pizzeria_name