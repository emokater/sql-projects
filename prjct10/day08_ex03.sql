-- Session #1
-- начинаю режим транзакции:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- проверяю рейтинг до обновления во 2 сеансе
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- проверяю рейтинг после обновления и публикации во 2 сеансе
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- публикую изменения
COMMIT;
-- сверяю рейтинг
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
-- начинаю режим транзакции:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- обновления рейтинга до значения 3.6
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- публикую изменения
COMMIT;
-- сверяю рейтинг после публикации в 1 сеансе
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';