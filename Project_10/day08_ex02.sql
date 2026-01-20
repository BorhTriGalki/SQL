
-- Session #1

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- начало транзакции с уровнем изоляции REPEATABLE READ

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка рейтинга

UPDATE pizzeria 
SET rating = 4 
WHERE name = 'Pizza Hut';
-- обновление рейтинга

COMMIT; -- фиксация изменений

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка внесенных изменений

-- Session #2

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- начало транзакции с уровнем изоляции REPEATABLE READ

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка рейтинга

UPDATE pizzeria 
SET rating = 3.6 
WHERE name = 'Pizza Hut';
-- обновление рейтинга
-- вот здесь вылезла ошибка из-за параллельного изменения

COMMIT; -- фиксация изменений

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка внесенных изменений