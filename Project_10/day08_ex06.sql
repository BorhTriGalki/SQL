-- Session #1

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- начало транзакции с уровнем изоляции REPEATABLE READ

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

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- начало транзакции с уровнем изоляции REPEATABLE READ

INSERT INTO pizzeria
VALUES (11, 'Kazan Pizza 2', 4);
-- добавление новой пиццерии в таблицу

COMMIT; -- фиксация изменений

SELECT SUM(rating)
FROM pizzeria;
-- проверка измененной суммы рейтинга