-- Session #1

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- начало транзакции с уровнем изоляции SERIALIZABLE

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

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- начало транзакции с уровнем изоляции SERIALIZABLE

UPDATE pizzeria 
SET rating = 3.0
WHERE name = 'Pizza Hut';
-- обновление рейтинга

COMMIT; -- фиксация изменений

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка внесенных изменений