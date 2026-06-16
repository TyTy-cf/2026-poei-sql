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

-- 5 (WIP)

SELECT
    account_id, 
    CONCAT(
        (
            SELECT COUNT(installed)
            FROM library
            WHERE installed = 1;
        ),
        "/",
        (
            SELECT COUNT(installed)
            FROM library
        )
    ) AS games_installed
FROM library;