 -- Session #1 --
-- Показывает текущий уровень изоляции в Session #1
 SHOW TRANSACTION ISOLATION LEVEL;
--  read committed

-- проверка текущего рейтинга у Pizza Hut в Session #1
SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2 --
-- Показывает текущий уровень изоляции в Session #2
SHOW TRANSACTION ISOLATION LEVEL;                                                                               

-- проверка текущего рейтинга у Pizza Hut в Session #2
SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Обновление рейтинга у Pizza Hut в Session #1
BEGIN;
UPDATE pizzeria 
SET rating = 4
WHERE name = 'Pizza Hut';
-- Результат: UPDATE 1

-- Session #2 пытается обновить ту же строку.
BEGIN;
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
-- UPDATE ожидает завершения транзакции Session #1.

-- Session #1
COMMIT;
-- Session #2
-- После COMMIT в Session #1, в Session #2 появилась строка UPDATE 1
COMMIT;

-- вывод рейтинга Pizza Hut после команды COMMIT в Session #2
SELECT rating 
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Итоговое значение рейтинга Pizza Hut = 3.6