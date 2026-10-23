-- Session #1 --
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT SUM (rating)
FROM pizzeria;
-- результат 21.9

-- Session #2 --
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

INSERT INTO pizzeria (id, name, rating)
VALUES (10, 'Kazan Pizza', 5);
-- INSERT 0 1
COMMIT;

-- Session #1 --
COMMIT;
SELECT SUM (rating)                                                    
FROM pizzeria;
-- результат 26.9

-- Session #2 --
SELECT SUM (rating)                                                    
FROM pizzeria;
-- результат 26.9