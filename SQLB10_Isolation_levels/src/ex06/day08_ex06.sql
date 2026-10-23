-- Session #1 --
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT SUM(rating)
FROM pizzeria;
-- результат 26.9

-- Session #2 --
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Добавляем в таблицу pizzeria новую строку с данными
INSERT INTO pizzeria (id, name, rating)
VALUES (11, 'Kazan Pizza 2', 4);

-- Session #1 --
SELECT SUM(rating)
FROM pizzeria;
-- результат 26.9

-- Session #2 --
 COMMIT;

-- Session #1 --
COMMIT;
SELECT SUM(rating)
FROM pizzeria;
-- результат 30.9

-- Session #2 --
SELECT SUM(rating)
FROM pizzeria;
-- результат 30.9