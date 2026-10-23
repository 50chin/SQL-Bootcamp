INSERT INTO
  person_order (id, person_id, menu_id, order_date)
SELECT
  MAX(po.id) + 1,
  (
    SELECT
      per.id
    FROM
      person AS per
    WHERE
      per.name = 'Denis'
  ),
  (
    SELECT
      me.id
    FROM
      menu AS me
    WHERE
      me.pizza_name = 'sicilian pizza'
  ),
  CAST('2022-02-24' AS DATE)
FROM
  person_order AS po
UNION ALL
SELECT
  MAX(po.id) + 2,
  (
    SELECT
      per.id
    FROM
      person AS per
    WHERE
      per.name = 'Irina'
  ),
  (
    SELECT
      me.id
    FROM
      menu AS me
    WHERE
      me.pizza_name = 'sicilian pizza'
  ),
  CASt('2022-02-24' AS DATE)
FROM
  person_order AS po