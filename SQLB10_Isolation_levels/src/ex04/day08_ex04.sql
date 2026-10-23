-- Session #1 --
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';
-- результат 3.6

-- Session #2 --
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';
-- результат 3.6
UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';
-- результат UPDATE 1
COMMIT;

-- Session #1 --
SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';
-- результат 3.6
COMMIT;

SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';
-- результат 3.0

-- Session #2 --
SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';
-- результат 3.0
