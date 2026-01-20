-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    ROUND(b.money * COALESCE(
        (SELECT rate_to_usd
        FROM currency c2
        WHERE c2.id = b.currency_id
        ORDER BY ABS(EXTRACT(EPOCH FROM c2.updated - b.updated))
        LIMIT 1), 1
        ), 3
    ) AS currency_in_usd
FROM balance b
LEFT JOIN "user" u 
    ON u.id = b.user_id
JOIN (SELECT DISTINCT id, name FROM currency) c 
    ON c.id = b.currency_id
ORDER BY 1 DESC, 2 ASC, 3 ASC;