COMMENT ON TABLE person_discounts IS 'Хранит персональные скидки клиента в конкретных пиццериях';

COMMENT ON COLUMN person_discounts.id IS 'Primary key уникальный идентификатор';

COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента, ссылающийся на person.id и определяющий владельца скидки';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, ссылающийся на pizzeria.id и определяющий конкретной пиццерии';

COMMENT ON Column person_discounts.discount IS 'Персональная скидка  клиента в зависимости от количества заказов, в диапазоне от 0 до 100';


-- SELECT count(*) = 5 AS check
-- FROM pg_description
-- WHERE objoid = 'person_discounts'::regclass