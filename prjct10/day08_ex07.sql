-- Session 1
-- начинаю режим транзакции:
BEGIN;
-- обновляю рейтинг у пиццерии с id=1 (беру блокировку на строку id=1)
UPDATE pizzeria SET rating = 5.0 WHERE id = 1;
-- обновляю рейтинг у пиццерии с id=2 (пытаемся обновить)
UPDATE pizzeria SET rating = 5.0 WHERE id = 2;
-- публикую изменения
COMMIT;

-- Session 2
-- начинаю режим транзакции:
BEGIN;
-- обновляю рейтинг у пиццерии с id=2 (беру блокировку на строку id=2)
UPDATE pizzeria SET rating = 5.0 WHERE id = 2;
-- обновляю рейтинг у пиццерии с id=1 (пытаемся обновить)
UPDATE pizzeria SET rating = 5.0 WHERE id = 1;
-- публикую изменения
COMMIT;