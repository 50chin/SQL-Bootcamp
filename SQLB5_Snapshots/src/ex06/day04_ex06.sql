CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT
  pi.name AS pizzeria_name
FROM
  (
    SELECT
      id
    FROM
      person
    WHERE
      name = 'Dmitriy'
  ) AS dm_id (id)
  JOIN person_visits AS po ON dm_id.id = po.person_id
  JOIN pizzeria AS pi ON po.pizzeria_id = pi.id
  AND po.visit_date = '2022-01-08'
  JOIN menu AS me ON pi.id = me.pizzeria_id
  and price < 800
WITH
  DATA