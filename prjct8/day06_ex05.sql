COMMENT ON TABLE person_discounts IS
'Таблица хранит персональные скидки клиентов по пиццериям.';

COMMENT ON COLUMN person_discounts.id IS
'Уникальный идентификатор записи о скидке';

COMMENT ON COLUMN person_discounts.person_id IS
'Ссылка на клиента (таблица person)';

COMMENT ON COLUMN person_discounts.pizzeria_id IS
'Ссылка на пиццерию, где действует персональная скидка';

COMMENT ON COLUMN person_discounts.discount IS
'Размер скидки в процентах'