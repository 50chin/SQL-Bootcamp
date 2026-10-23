SELECT name, rating
FROM pizzeria AS pi
LEFT JOIN person_visits AS pv ON pi.id = pv.pizzeria_id
WHERE pv.visit_date IS NULL