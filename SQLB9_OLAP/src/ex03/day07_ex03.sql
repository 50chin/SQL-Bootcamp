SELECT
  pi.name,
  SUM(count) AS total_count
FROM
  (
    (
      SELECT
        pi.name,
        COUNT(*) AS count
      FROM
        person_visits AS pv
        JOIN pizzeria AS pi ON pi.id = pv.pizzeria_id
      GROUP BY
        pi.name
    )
    UNION ALL
    (
      SELECT
        pi.name,
        COUNT(*) AS count
      FROM
        person_order AS po
        JOIN menu AS m ON po.menu_id = m.id
        JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
      GROUP BY
        pi.name
    )
  ) AS pi
GROUP BY
  pi.name
ORDER BY
  total_count DESC,
  pi.name