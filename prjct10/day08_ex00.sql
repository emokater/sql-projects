-- Session #1
-- начинаю режим транзакции:
BEGIN;
-- обновляю рейтинг:
UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut';
-- проверяю на наличие изменений:
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- публикую изменения:
COMMIT;

-- Session #2
-- проверка на отсутсвие обновления по рейтингу до коммита:
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- проверка на присутсвие обновления по рейтингу после коммита:
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut';