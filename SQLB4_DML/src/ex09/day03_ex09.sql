INSERT INTO
  person_visits (id, person_id, pizzeria_id, visit_date)
SELECT
  MAX(pv.id) + 1,
  (
    SELECT
      id
    FROM
      person
    WHERE
      name = 'Denis'
  ),
  (
    SELECT
      ID
    FROM
      pizzeria
    WHERE
      pizzeria.name = 'Dominos'
  ),
  CAST('2022-02-24' AS DATE)
FROM
  person_visits AS pv
UNION ALL
SELECT
  MAX(pv.id) + 2,
  (
    SELECT
      id
    FROM
      person
    WHERE
      name = 'Irina'
  ),
  (
    SELECT
      ID
    FROM
      pizzeria
    WHERE
      pizzeria.name = 'Dominos'
  ),
  CAST('2022-02-24' AS DATE)
FROM
  person_visits AS pv