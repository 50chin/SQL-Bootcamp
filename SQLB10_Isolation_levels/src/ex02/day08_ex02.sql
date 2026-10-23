-- Session #1 --
-- начало транзакции с уровнем изоляции REPEATABLE READ
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- проверка данной транзакции
SHOW TRANSACTION ISOLATION LEVEL;

-- вывод текущего рейтинга у Pizza Hut
SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';

-- обновление рейтинга Pizza Hut на 4
UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';
-- Результат UPDATE 1

-- Session #2 --
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- вывод текущего рейтинга у Pizza Hut
SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';

-- обновление рейтинга Pizza Hut на 3.6
UPDATE pizzeria 
SET rating = 3.6
WHERE name = 'Pizza Hut';
-- UPDATE ожидает завершения транзакции в Session #1

-- Session #1 --
COMMIT;
-- Session #2 --
-- Ошибка - ERROR:  could not serialize access due to concurrent update
-- отмена транзакции 
COMMIT;

-- вывод текущего рейтинга у Pizza Hut
SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Результат: 4

-- Итог: при уровне изоляции REPEATABLE READ возникает ошибка