-- Session #1
-- начинаю режим транзакции:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- суммирование всех рейтингов для всех пиццерий ДО обновления по 2 сеансе 
SELECT SUM(rating) FROM pizzeria;
-- суммирование всех рейтингов для всех пиццерий ПОСЛЕ обновления во 2 сеансе
SELECT SUM(rating) FROM pizzeria;
-- публикую изменения + сверяю сумму
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- Session #2
-- начинаю режим транзакции:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- вставка нового ресторана ПОСЛЕ суммирования рейтинга в 1 сеансе + публикация
INSERT INTO pizzeria(id, name, rating) VALUES (10, 'Kazan Pizza', 5.0);
COMMIT;
-- сверяю сумму после обновы в 1 сеансе
SELECT SUM(rating) FROM pizzeria;
