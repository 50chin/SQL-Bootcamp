-- SELECT
--   name AS pizzeria_name
-- FROM
--   pizzeria AS pi
-- WHERE
--   pi.id NOT IN (
--     SELECT
--       pv.pizzeria_id
--     FROM
--       person_visits AS pv
--     WHERE
--       pv.pizzeria_id IS NOT NULL
--   );
SELECT
  name AS pizzeria_name
FROM
  pizzeria
WHERE
  NOT EXISTS (
    SELECT
      pizzeria_id
    FROM
      person_visits
    WHERE
      pizzeria_id = pizzeria.id
  );