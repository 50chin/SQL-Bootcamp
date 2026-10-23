SELECT
    t.name,
    t.lastname,
    currency_name,
    money * rate_to_usd AS currency_in_usd
FROM (
         SELECT
             COALESCE(u.name, 'not defined') AS name,
             COALESCE(u.lastname, 'not defined') AS lastname,
             c.name AS currency_name,
             b.money,
             COALESCE((SELECT rate_to_usd
                       FROM currency c
                       WHERE b.currency_id = c.id AND c.updated < b.updated
                       ORDER BY c.updated DESC
                      LIMIT 1),
				(SELECT rate_to_usd
				FROM currency AS c
				WHERE b.currency_id = c.id AND c.updated > b.updated
				ORDER BY c.updated ASC
				LIMIT 1
				)) AS rate_to_usd
         FROM balance AS b
         INNER JOIN (SELECT c.id, c.name FROM currency c GROUP BY c.id, c.name) AS c
            ON c.id = b.currency_id
         LEFT JOIN "user" AS u
            ON b.user_id = u.id
     ) t
ORDER BY name DESC, lastname, currency_name;