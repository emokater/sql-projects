-- Session #1
-- начинаю режим транзакции:
BEGIN;
-- проверяю рейтинг для "Pizza Hut" в первом сеансе
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- обновления рейтинга до значения 4
UPDATE pizzeria SET rating = 4.0 WHERE name = 'Pizza Hut';
-- публикую изменения (только после обновления во 2 сеансе)
COMMIT;
-- сверяю рейтинг
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
-- начинаю режим транзакции:
BEGIN;
-- проверяю рейтинг для "Pizza Hut" во втором сеансе
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- обновления рейтинга до значения 3.6
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- публикую изменения (только после обновления в 1 сеансе)
COMMIT;
-- сверяю рейтинг
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
