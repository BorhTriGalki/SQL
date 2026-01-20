-- Session #1

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- начало транзакции с уровнем изоляции READ COMMITTED

UPDATE pizzeria
SET rating = 4
WHERE id = 1;
-- меняем рейтинг пиццерии с id = 1

UPDATE pizzeria
SET rating = 4
WHERE id = 2;
-- меняем рейтинг пиццерии с id = 2

COMMIT; -- фиксация изменений

-- Session #2

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- начало транзакции с уровнем изоляции READ COMMITTED

UPDATE pizzeria
SET rating = 3.5
WHERE id = 2;
-- меняем рейтинг пиццерии с id = 2

UPDATE pizzeria
SET rating = 3.5
WHERE id = 1;
-- меняем рейтинг пиццерии с id = 1
-- на этом моменте воспроизводится ситуация взаимоблокировки
-- и командная строка выводит ошибку

COMMIT; -- фиксация изменений