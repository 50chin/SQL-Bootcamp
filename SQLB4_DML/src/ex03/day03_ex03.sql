(
  SELECT
    pi.name AS pizzeria_name
  FROM
    person AS per
    JOIN person_visits AS pv ON per.id = pv.person_id
    JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
  WHERE
    per.gender = 'female'
  EXCEPT ALL
  SELECT
    pi.name AS pizzeria_name
  FROM
    person AS per
    JOIN person_visits AS pv ON per.id = pv.person_id
    JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
  WHERE
    per.gender = 'male'
)
UNION ALL
(
  SELECT
    pi.name AS pizzeria_name
  FROM
    person AS per
    JOIN person_visits AS pv ON per.id = pv.person_id
    JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
  WHERE
    per.gender = 'male'
  EXCEPT ALL
  SELECT
    pi.name AS pizzeria_name
  FROM
    person AS per
    JOIN person_visits AS pv ON per.id = pv.person_id
    JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
  WHERE
    per.gender = 'female'
)
ORDER BY
  pizzeria_name