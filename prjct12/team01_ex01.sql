WITH t1 AS (
    SELECT b.user_id,
        b.type,
        b.updated AS balance_updated,
        c.id AS currency_id,
        MAX(c.updated) AS currency_updated
    FROM balance b
    JOIN currency c ON c.id = b.currency_id
    WHERE c.updated < b.updated
    GROUP BY b.user_id, b.type, b.updated, c.id
), t2 AS (
    SELECT b.user_id,
        b.type,
        b.updated AS balance_updated,
        c.id AS currency_id,
        MIN(c.updated) AS currency_updated
    FROM balance b
    JOIN currency c ON c.id = b.currency_id
    WHERE c.updated > b.updated
    GROUP BY b.user_id, b.type, b.updated, c.id
), picked AS (
    SELECT b.user_id,
        b.type,
        b.updated AS balance_updated,
        b.money,
        b.currency_id,
        COALESCE(t1.currency_updated, t2.currency_updated) AS currency_updated
    FROM balance b
    LEFT JOIN t1 ON t1.user_id = b.user_id
      AND t1.type = b.type
      AND t1.balance_updated = b.updated
      AND t1.currency_id = b.currency_id
    LEFT JOIN t2 ON t2.user_id = b.user_id
      AND t2.type = b.type
      AND t2.balance_updated = b.updated
      AND t2.currency_id = b.currency_id)

SELECT COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    p.money * c.rate_to_usd AS currency_in_usd
FROM picked p
LEFT JOIN "user" u ON u.id = p.user_id
JOIN currency c ON c.id = p.currency_id AND c.updated = p.currency_updated
ORDER BY (COALESCE(u.name, 'not defined') = 'not defined') ASC,
    COALESCE(u.name, 'not defined') DESC,
    u.lastname ASC,
    currency_name ASC;