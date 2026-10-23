INSERT INTO
  person_discounts (id, person_id, pizzeria_id, discount)
SELECT
  ROW_NUMBER() OVER () AS id,
  po.person_id,
  pi.id AS pizzeria_id,
  CASE
    WHEN COUNT(*) = 1 THEN 10.5
    WHEN COUNT(*) = 2 THEN 22
    ELSE 30
  END as discount
FROM
  person_order AS po
  JOIN menu AS m ON po.menu_id = m.id
  JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
GROUP BY
  po.person_id,
  pi.id;
  
  
-- SELECT count(*) > 0 AS check
-- FROM person_discounts