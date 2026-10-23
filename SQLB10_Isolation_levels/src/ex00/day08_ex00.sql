-- Session #1 -- 
-- Начинаем транзакцию
BEGIN;

-- Изменяем rating Pizza Hut внутри транзакции  
UPDATE pizzeria 
SET rating = 5
WHERE name = 'Pizza Hut';

-- Проверяем изменение в Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Обновился rating Pizza Hut
-- src/images/ex00/s1.png

-- Session #2 --
-- Проверяем rating до COMMIT
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Изменения пока не видны
-- src/images/ex00/s2.png

-- Session #1
-- Фиксируем изменения и делаем видимым для других
COMMIT;

-- Session #2
-- Проверяем рейтинг после COMMIT в Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Результат Session #2 после COMMIT в Session #1 --
-- src/images/ex00/s3.png