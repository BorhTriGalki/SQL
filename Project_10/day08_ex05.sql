-- Session #1

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- начало транзакции с уровнем изоляции READ COMMITTED

SELECT SUM(rating)
FROM pizzeria;
-- вывод суммированного рейтинга всех пиццерий

SELECT SUM(rating)
FROM pizzeria;
-- еще один вывод суммированного рейтинга всех пиццерий

COMMIT; -- завершил транзакцию

SELECT SUM(rating)
FROM pizzeria;
-- финальный вывод суммированного рейтинга всех пиццерий

-- Session #2

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- начало транзакции с уровнем изоляции READ COMMITTED

INSERT INTO pizzeria
VALUES (10, 'Kazan Pizza', 5);
-- добавление новой пиццерии в таблицу

COMMIT; -- фиксация изменений

SELECT SUM(rating)
FROM pizzeria;
-- проверка измененной суммы рейтинга