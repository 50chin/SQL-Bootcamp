SELECT
  p.name,
  count(*) AS count_of_visits
FROM
  person AS p
  JOIN person_visits AS pv ON p.id = pv.person_id
GROUP BY
  p.name
ORDER BY
  count_of_visits DESC,
  p.name
LIMIT
  4;