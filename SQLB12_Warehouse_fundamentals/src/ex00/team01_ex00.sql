-- Ситуация: пользователь без баланса, баланс без пользователя, отсутствующие валюты

-- последний курс для каждой валюты (по максимальному updated)
WITH latest_currency AS (
    SELECT DISTINCT ON (id) 
        id, 
        name, 
        rate_to_usd
    FROM currency
    ORDER BY id, updated DESC  -- сортируем чтобы DISTINCT ON взял самую свежую запись
)
SELECT 
    COALESCE(u.name, 'not defined') AS name,  -- если user.name NULL, подставляем 'not defined'
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.type,
    SUM(b.money) AS volume,  -- суммируем все движения средств
    COALESCE(c.name, 'not defined') AS currency_name,  -- если валюта отсутствует
    COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,  -- если курс NULL, используем 1
    SUM(b.money) * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd  -- volume * last_rate_to_usd
FROM balance b

-- сохраним все записи (включая balance без user и user без balance)
FULL OUTER JOIN "user" u ON u.id = b.user_id

-- если currency_id не найден, currency будет NULL (обработаем через COALESCE)
LEFT JOIN latest_currency c ON c.id = b.currency_id
GROUP BY 
    u.name, 
    u.lastname, 
    b.type, 
    c.name, 
    c.rate_to_usd
ORDER BY 
    name DESC,
    lastname ASC,
    type ASC;