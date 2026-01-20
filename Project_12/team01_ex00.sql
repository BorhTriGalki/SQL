WITH 
balance_sum AS (
    SELECT 
        user_id,
        type,
        currency_id,
        SUM(money) AS volume
    FROM balance
    GROUP BY user_id, type, currency_id
),
currency_latest AS (
    SELECT DISTINCT ON (id)
        id,
        COALESCE(name, 'not defined') AS name,
        COALESCE(rate_to_usd, 1) AS rate_to_usd
    FROM currency
    ORDER BY id, updated DESC
)

SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    bs.type,
    bs.volume,
    COALESCE(cl.name, 'not defined') AS currency_name,
    COALESCE(cl.rate_to_usd, 1) AS last_rate_to_usd,
    ROUND(bs.volume * COALESCE(cl.rate_to_usd, 1), 2) AS total_volume_in_usd
FROM balance_sum bs
LEFT JOIN "user" u 
    ON u.id = bs.user_id
LEFT JOIN currency_latest cl 
    ON cl.id = bs.currency_id
ORDER BY 1 DESC, 2 ASC, 3 ASC;