WITH last_currency AS (
    SELECT
        c.id,
        c.name,
        c.rate_to_usd,
        ROW_NUMBER() OVER (PARTITION BY c.id ORDER BY c.updated DESC NULLS LAST) AS rn -- rn с id 1 самые свежие
    FROM Currency AS c
),
balance_aggregated AS (
    SELECT
        b.user_id,
        b.type,
        b.currency_id,
        SUM(b.money) AS volume
    FROM Balance AS b
    GROUP BY b.user_id, b.type, b.currency_id
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    ba.type,
    ba.volume,
    COALESCE(lc.name, 'not defined') AS currency_name,
    COALESCE(lc.rate_to_usd, 1) AS last_rate_to_usd,
    ba.volume * COALESCE(lc.rate_to_usd, 1) AS total_volume_in_usd
    -- ROUND(ba.volume * COALESCE(lc.rate_to_usd, 1),0) AS total_volume_in_usd
FROM balance_aggregated AS ba
LEFT JOIN "user" AS u ON u.id = ba.user_id
LEFT JOIN last_currency AS lc ON lc.id = ba.currency_id AND lc.rn = 1
ORDER BY
    COALESCE(u.name, 'not defined') DESC,
    COALESCE(u.lastname, 'not defined') ASC,
    ba.type ASC;
