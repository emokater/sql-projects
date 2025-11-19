-- Session #1
-- начинаю режим транзакции:
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- проверяю рейтинг ДО обновления и публикации во 2 сеансе
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- проверяю рейтинг ПОСЛЕ обновления и публикации во 2 сеансе
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- публикую изменения + сверяю рейтинг
COMMIT;
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
-- начинаю режим транзакции:
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- обновления рейтинга до значения 3.0 + публикация изменений
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;
-- сверяю рейтинг после публикации в 1 сеансе
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';