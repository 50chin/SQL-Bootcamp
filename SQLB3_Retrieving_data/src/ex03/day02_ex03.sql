	WITH dates AS (
    SELECT gs.missing_date
     FROM  GENERATE_SERIES(
  CAST('2022-01-01' AS DATE), 
  CAST('2022-01-10' AS DATE),
  CAST('1 day' AS interval)) 
    AS gs(missing_date)
   )
  
SELECT dates.missing_date 
FROM dates
LEFT JOIN person_visits AS pv ON pv.visit_date = dates.missing_date AND 
(pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.person_id IS NULL

ORDER by dates.missing_date
