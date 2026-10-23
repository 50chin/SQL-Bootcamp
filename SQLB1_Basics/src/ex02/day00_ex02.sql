SELECT name, rating
FROM pizzeria
WHERE rating >= 3.5 AND rating <= 5
ORDER BY rating;

-- Второй способ с помощью "BETWEEN"
SELECT name, rating
FROM pizzeria
WHERE rating BETWEEN 3.5 AND 5
ORDER BY rating;