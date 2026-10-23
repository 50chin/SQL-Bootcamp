SELECT pizza_name, pi.name AS pizzeria_name, price
FROM menu AS me
JOIN pizzeria AS pi ON pi.id = me.pizzeria_id 
WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza') 

ORDER BY pizza_name, pizzeria_name