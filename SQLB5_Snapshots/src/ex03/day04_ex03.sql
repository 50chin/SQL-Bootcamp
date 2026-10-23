SELECT
  gd.generated_date AS missing_date
FROM
  v_generated_dates AS gd
  LEFT JOIN person_visits AS pv ON pv.visit_date = gd.generated_date
WHERE
  pv.visit_date IS NULL
ORDER BY
  missing_date