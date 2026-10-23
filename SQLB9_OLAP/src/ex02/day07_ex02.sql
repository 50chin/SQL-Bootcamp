(
  SELECT
    pi.name,
    COUNT(*) AS count,
    'visit' AS action_type
  FROM
    person_visits AS pv
    JOIN pizzeria AS pi ON pi.id = pv.pizzeria_id
  GROUP BY
    pi.name
  ORDER BY
    count DESC
  LIMIT
    3
)
UNION ALL
(
  SELECT
    pi.name,
    COUNT(*) AS count,
    'order' AS action_type
  FROM
    person_order AS po
    JOIN menu AS m ON po.menu_id = m.id
    JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
  GROUP BY
    pi.name
  ORDER BY
    count DESC
  LIMIT
    3
)
ORDER BY
  action_type,
  count DESC;