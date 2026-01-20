COMMENT ON TABLE person_discounts IS 'Таблица для хранения информации о персональных скидках клиентов в пиццериях';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор персональной скидки';
COMMENT ON COLUMN person_discounts.person_id IS 'Уникальный идентификатор клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Уникальный идентификатор пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Процент персональной скидки';