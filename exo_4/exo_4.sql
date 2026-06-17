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
SELECT a.name,
       CONCAT(
               SUM(l.installed),
               '/',
               COUNT(*)
       ) AS installed_games
FROM account a
         JOIN library l
              ON l.account_id = a.id
GROUP BY a.id, a.name;

-- 6)-------------------

SELECT a.name, IF(SUM(g.price) IS NULL, 0, SUM(g.price)) AS library_value
FROM account a
         LEFT JOIN library l ON a.id = l.account_id
         LEFT JOIN game g ON l.game_id = g.id
GROUP BY a.id
ORDER BY library_value DESC

-- 7)-------------------
SELECT COUNT(*),
       a.nickname
FROM account a
GROUP BY a.nickname
HAVING COUNT(*) > 1


-- 8)--------------
SELECT COUNT(l.game_id),
       g.name
FROM game g
         LEFT JOIN library l
                   ON l.game_id = g.id

WHERE g.id = l.game_id
GROUP BY g.name
ORDER BY `COUNT(l.game_id)` DESC

-- 9) ---------------
SELECT (sum(g.price) )AS TOTAL_GAIN,
       g.name,
       p.name
FROM game g
         LEFT JOIN library l
                   ON l.game_id = g.id
         JOIN publisher p
              ON p.id = g.publisher_id
GROUP BY p.id
ORDER BY TOTAL_GAIN DESC;

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

-- 14)------------------
SELECT g.name,
       g.published_at

FROM game g
ORDER BY g.published_at ASC LIMIT 1;
-- 15)------------------
SELECT g.name,
       ROUND(AVG(c.rank), 2) AS note_moyenne
FROM game AS g
         JOIN comment AS c
              ON c.game_id = g.id
GROUP BY g.id
ORDER BY note_moyenne DESC;
-- 16 ---

SELECT g.name,
       SUM(c.down_votes) AS total_down

FROM game AS g
         JOIN comment AS c
              ON c.game_id = g.id
GROUP BY g.id
ORDER BY total_down DESC LIMIT 1;

-- 17) --------------------------------
-- WHERE filtre les lignes, HAVING filtre les groupes.

SELECT g.name,
       ROUND(AVG(c.rank), 2) AS note_moyenne
FROM game AS g
         JOIN comment AS c
              ON c.game_id = g.id

GROUP BY g.id
HAVING AVG(c.rank) > (SELECT AVG(rank)
                      FROM comment);
-- 18) ----------------------
SELECT a.name,
       l.game_id

FROM account a
         LEFT JOIN library l
                   ON l.account_id = a.id
GROUP BY a.id
HAVING COUNT(l.game_id) = 0

-- 19) ----------------------------

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
ORDER BY COUNT(*) DESC LIMIT 1;

