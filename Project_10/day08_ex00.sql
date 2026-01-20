-- Session #1

BEGIN; -- начало явной транзакции

UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
-- обновил рейтинг пиццерии

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверил, что вижу изменения в этой сессии

-- Session #2

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка, что не вижу изменения из сессии 1 в сессии 2

-- Session #1

COMMIT; -- фиксация изменений, сделанных в транзакции

-- Session #2

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- проверка, что вижу изменения, сделанные в сессии 1