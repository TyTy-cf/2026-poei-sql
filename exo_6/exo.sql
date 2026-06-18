-- 1

SELECT 
    album.name, 
    artist.name, 
    DATE_FORMAT(album.published_at, "%Y") AS published_year
FROM album
JOIN artist ON artist.id = album.artist_id
ORDER BY album.published_at DESC
LIMIT 9;

-- 2

SELECT 
    artist.name AS "Nom artiste",
    album.name AS "Nom album",
    DATE_FORMAT(album.published_at, "%Y") AS "Année de sortie"
FROM artist
JOIN album ON album.artist_id = artist.id
ORDER BY artist.name, DATE_FORMAT(album.published_at, "%Y");

-- 3

SELECT 
    a.name, 
    COUNT(p.account_id) AS playlist_length
FROM account AS a
JOIN playlist AS p ON p.account_id = a.id
GROUP BY a.id;

-- 4

SELECT
    a.name AS "Nom album",
    SUM(s.duration) AS "Durée totale",
    COUNT(as.song_id) AS "Nombre de chansons"
FROM album_song AS `as`
JOIN album AS a ON a.id = `as`.album_id
JOIN song AS s ON s.id = `as`.song_id
GROUP BY a.name;

-- 5

SELECT 
    name,
    DATE_FORMAT(created_at, "%Y") AS year_creation
FROM artist
WHERE year_creation = (
    SELECT MIN(DATE_FORMAT(created_at, "%Y"))
    FROM artist
);

-- 6

SELECT
    ROUND(
        AVG(DATE_FORMAT(
            NOW(), "%Y"
        )- DATE_FORMAT(
            birth_date, "%Y"
            )
        ),
        2
    ) AS avg_age_user
FROM account;

-- 7

SELECT
    COUNT(newsletter) AS amount_subscribed_to_news
FROM account
WHERE newsletter = 1;

-- 8

SELECT
    IF (
        gender = "F",
        "« F » = Femme",
        IF (
            gender = "H",
            "« H » = Homme",
            IF (
                gender = "NB",
                "« NB » = Non-binaire" ,
                "« NR » = Non-renseigné"
            )
        )
    ),
    COUNT(gender) AS amount_gender
FROM account
GROUP BY gender;

-- 9

SELECT
    s.name,
    COUNT(`as`.subscription_id) AS subscribed_year_2021
FROM subscription AS s
JOIN account_subscription AS `as` ON `as`.subscription_id = s.id
WHERE 
    `as`.effective_at LIKE "201%" OR `as`.effective_at LIKE "2020%" OR `as`.effective_at LIKE "2021%"
    AND
    (
        (`as`.finished_at LIKE "201%" OR `as`.finished_at LIKE "2020%" OR `as`.finished_at LIKE "2021%") 
        OR 
        (`as`.finished_at IS NULL)
    )
GROUP BY s.id;

-- 10

SELECT
    name
FROM account
WHERE id NOT IN (
    SELECT a.id
    FROM account AS a
    JOIN playlist AS p ON p.account_id = a.id
    GROUP BY a.id
    HAVING COUNT(a.id) > 0
);

-- 11

SELECT
    p.name AS "Nom playlist",
    a.name AS "Nom propriétaire",
    COUNT(alp.playlist_id) AS "Nombre de like"
FROM playlist AS p
JOIN account AS a ON a.id = p.account_id
JOIN account_like_playlist AS alp ON alp.playlist_id = p.id
GROUP BY p.id;

-- 12

SELECT
    a.name,
    COUNT(p.account_id) AS playlist_amount
FROM account AS a
LEFT JOIN playlist AS p ON p.account_id = a.id
GROUP BY a.id;

-- 13

SELECT
    CONCAT(
        ROUND((SUM(s.duration) / 3600), 0),
        "h",
        ROUND(((SUM(s.duration) % 3600) / 60), 0),
        "m",
        ROUND(((SUM(s.duration) % 3600) % 60), 0),
        "s"
    ) AS duration_total
FROM playlist AS p
JOIN playlist_song AS ps ON ps.playlist_id = p.id
JOIN song AS s ON s.id = ps.song_id;

-- 14

SELECT
    name,
    (
        DATE_FORMAT(NOW(), "%Y-%m-%d") 
        - 
        DATE_FORMAT(birth_date, "%Y-%m-%d")
    ) AS age
FROM account;

-- 15

SELECT
    COUNT(*) AS gmail_users
FROM account
WHERE email LIKE "%@gmail.com";

-- 16

SELECT
    COUNT(*) AS min_6_years_old_accounts
FROM account
WHERE created_at > (NOW() - INTERVAL 6 YEAR);

-- 17

SELECT
    CONCAT(ROUND(SUM(s.cost), 2), "€") AS spotifish_earnings
FROM subscription AS s
JOIN account_subscription AS `as` ON `as`.subscription_id = s.id
WHERE `as`.finished_at IS NOT NULL;