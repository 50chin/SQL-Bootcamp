CREATE VIEW
  v_generated_dates AS
SELECT
  generate_series (
    CAST('2022-01-01' AS DATE),
    CAST('2022-01-31' AS DATE),
    CAST('1 day' AS INTERVAL)
  ) AS generated_date
ORDER BY
  generated_date

  SELECT count(*) = 31 AS CHECK,
min(generated_date) AS check1,
max(generated_date) AS check2
FROM v_generated_dates;