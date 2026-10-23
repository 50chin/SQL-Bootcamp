SET
  enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT
  me.pizza_name,
  pi.name AS pizzeria_name
FROM
  menu AS me
  JOIN pizzeria AS pi ON me.pizzeria_id = pi.id