 SELECT COALESCE(t.person_name, '-'), 
 t.visit_date, 
 COALESCE(pi.name, '-') AS pizzeria_name
 FROM (
 SELECT per.name AS person_name, pv.visit_date, pv.pizzeria_id
  FROM person AS per
  LEFT JOIN person_visits AS pv ON per.id = pv.person_id 
   AND pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
) AS t
FULL JOIN pizzeria AS pi ON t.pizzeria_id = pi.id  

Order By COALESCE(t.person_name, '-'), t.visit_date, COALESCE(pi.name, '-')