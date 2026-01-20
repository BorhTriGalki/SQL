-- Session #1

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- начало транзакции с уровнем изоляции READ COMMITTED

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка рейтинга

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- еще одна проверка рейтинга после коммита в сессии 2

COMMIT; -- завершил транзакцию

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- и еще проверка после коммита

-- Session #2

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- начало транзакции с уровнем изоляции READ COMMITTED

UPDATE pizzeria 
SET rating = 3.6 
WHERE name = 'Pizza Hut';
-- обновление рейтинга

COMMIT; -- фиксация изменений

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка внесенных изменений