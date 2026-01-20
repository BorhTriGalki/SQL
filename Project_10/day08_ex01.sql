-- Session #1

SHOW TRANSACTION ISOLATION LEVEL; -- просмотреть установленный уровень изоляции
BEGIN; -- начало транзакции

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

SHOW TRANSACTION ISOLATION LEVEL; -- просмотреть установленный уровень изоляции
BEGIN; -- начало транзакции

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка рейтинга

UPDATE pizzeria 
SET rating = 3.6 
WHERE name = 'Pizza Hut';
-- обновление рейтинга

COMMIT; -- фиксация изменений

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка внесенных изменений