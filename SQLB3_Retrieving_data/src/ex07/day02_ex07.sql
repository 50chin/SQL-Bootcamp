WITH per AS (
  SELECT id
  FROM person
  WHERE name = 'Dmitriy'
  )
 SELECT pi.name AS pizzeria_name
 FROM per 
 JOIN person_visits AS pv ON per.id = pv.person_id AND pv.visit_date = '2022-01-08'
 JOIN pizzeria AS pi ON  pv.pizzeria_id = pi.id
JOIN menu AS me ON pi.id = me.pizzeria_id AND me.price < 800