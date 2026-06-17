-- 1

SELECT *
FROM game
ORDER BY published_at ASC;

-- 2

SELECT *
FROM game
WHERE price = (
    SELECT MAX(price)
    FROM game
);

-- 3

SELECT *
FROM game
JOIN game_genre ON game_genre.game_id = game.id
JOIN genre ON genre.id = game_genre.genre_id
WHERE genre.name = "FPS"
ORDER BY published_at ASC;

-- 4

SELECT a.name, SUM(l.game_time) AS "Temps"
FROM library
JOIN account AS a ON a.id = l.account_id
GROUP BY a.id;

-- 5

SELECT
    account_id AS aid,
    CONCAT(
        (
            SELECT COUNT(installed)
            FROM library
            WHERE installed = 1 AND account_id = aid
        ),
        "/",
        (
            SELECT COUNT(installed)
            FROM library
            WHERE account_id = aid
        )
    ) AS games_installed
FROM library
GROUP BY aid;

-- 6

SELECT
    l.account_id AS aid,
    CONCAT(SUM(g.price), "€") AS money_spent
FROM library AS l
JOIN game AS g ON g.id = l.game_id
GROUP BY aid;

-- 7

SELECT
	nickname
FROM account
GROUP BY nickname
HAVING COUNT(id) > 1;

-- 8

SELECT
    g.name,
    COUNT(l.game_id) AS quantity_sold
FROM library AS l
JOIN game AS g ON g.id = l.game_id
GROUP BY l.game_id
ORDER BY quantity_sold DESC;

-- 9

SELECT
    p.name,
    CONCAT((g.price*COUNT(l.game_id)), "€") AS earned_by_company
FROM game AS g
JOIN publisher AS p ON p.id = g.publisher_id
JOIN library AS l ON l.game_id = g.id
GROUP BY p.name 
ORDER BY (g.price*COUNT(l.game_id)) DESC;

-- 10

SELECT
    gr.name,
    COUNT(l.game_id) AS quantity_sold
FROM genre AS gr
JOIN game_genre AS gg ON gg.genre_id = gr.id
JOIN game AS g ON g.id = gg.game_id
JOIN library AS l ON l.game_id = g.id
GROUP BY l.game_id
ORDER BY quantity_sold DESC;

-- 11

SELECT
    g.name,
    COUNT(l.game_id) AS quantity_sold
FROM library AS l
JOIN game AS g ON g.id = l.game_id
GROUP BY l.game_id
ORDER BY quantity_sold DESC
LIMIT 3;

-- 12

SELECT
    g.name,
    SUM(l.game_time) AS total_playtime_all
FROM library AS l
JOIN game AS g ON g.id = l.game_id
GROUP BY l.game_id
ORDER BY total_playtime_all DESC
LIMIT 3;

-- 13 (WIP)

SELECT
    DATE_FORMAT(published_at, "%Y") AS year_of_publication
    GROUP_CONCAT(name)
FROM game
GROUP BY year_of_publication;