-- Session #1 --                                      
BEGIN;
UPDATE pizzeria
SET rating = 4.0
WHERE id = 1;
-- результат UPDATE 1

 -- Session #2 --  
BEGIN;
UPDATE pizzeria
SET rating = 4.1
WHERE id = 2;
-- результат UPDATE 1

-- Session #1 --
UPDATE pizzeria
SET rating = 4.2
WHERE id = 2;
-- команда ожидает освобождения блокировки

 -- Session #2 --  
UPDATE pizzeria
SET rating = 4.3
WHERE id = 1;
-- результат ERROR:  deadlock detected ...

-- Session #1 --
-- после ошибки в Session #2 появилась строка UPDATE 1 в Session #1
-- отмена транзакции 
 ROLLBACK;

 -- Session #2 --  
 -- отмена транзакции 
ROLLBACK;