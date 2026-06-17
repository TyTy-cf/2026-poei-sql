--1)----------------
SELECT *
FROM game as g
WHERE g.price =
      (SELECT MAX(price)
       FROM game);

-- 2)--------------------
SELECT *
FROM game as g

         JOIN game_genre as game_genre
              ON g.id = game_genre.game_id
         JOIN genre AS genre
              ON game_genre.genre_id = genre.id

WHERE genre.name = 'FPS'

-- 4)------------------
SELECT SUM(l.game_time) AS game_time,
       a.name

FROM account a
         JOIN library l
              ON l.account_id = a.id
GROUP BY a.id
ORDER BY game_time DESC;


--5) -------------------------
SELECT *
FROM game g
         JOIN library l
              ON l.game_id = g.id
WHERE l.installed = 1;

-- 6)-------------------

SELECT a.name, SUM(g.price) as price_Total
FROM game g
         JOIN library l ON g.id = l.game_id
         JOIN account a ON a.id = l.account_id
GROUP BY a.id
ORDER BY price_total DESC;


-- 7)-------------------
SELECT COUNT(*),
       a.nickname
FROM account a
GROUP BY a.nickname
HAVING COUNT(*) > 1


-- 8)--------------
SELECT COUNT(*),
       g.name
FROM game g
         JOIN library l
              ON l.game_id = g.id
         JOIN account a
              ON a.id = l.account_id

WHERE g.id = l.game_id
GROUP BY g.name
ORDER BY COUNT(*) DESC

-- 9) ---------------
SELECT (COUNT(*) * g.price) AS TOTAL_GAIN,
       g.name,
       p.name
FROM game g
         JOIN library l
              ON l.game_id = g.id
         JOIN account a
              ON a.id = l.account_id
         JOIN publisher p
              ON p.id = g.publisher_id

WHERE g.id = l.game_id
GROUP BY g.name
ORDER BY TOTAL_GAIN DESC

-- 10)----------------------------

SELECT COUNT(*) AS nb_sale,
       genre.name
FROM game g
         JOIN library l
              ON l.game_id = g.id
         JOIN account a
              ON a.id = l.account_id
         JOIN game_genre ga_ge
              ON g.id = ga_ge.game_id
         JOIN genre genre
              ON genre.id = ga_ge.genre_id


GROUP BY genre.name
ORDER BY COUNT(*) DESC

-- 11)-------------------
SELECT COUNT(*),
       g.name
FROM game g
         JOIN library l
              ON l.game_id = g.id
         JOIN account a
              ON a.id = l.account_id

WHERE g.id = l.game_id
GROUP BY g.name
ORDER BY COUNT(*) DESC LIMIT 3;
-- 12) ------------------
SELECT g.name,
       SUM(l.game_time) AS TMP_played

FROM game g
         JOIN library l
              ON l.game_id = g.id

GROUP BY g.name
ORDER BY TMP_played DESC LIMIT 3;

-- 13) --------------------------
SELECT
    YEAR (g.published_at) AS published_year, GROUP_CONCAT(g.name, ', ') AS games
FROM game AS g
GROUP BY YEAR (g.published_at)
ORDER BY published_year;