-- 4-1

SELECT * FROM game ORDER BY game.published_at;

-- 4-2  Far cry 5

SELECT * FROM game WHERE price = (SELECT MAX(price) FROM game);

-- 4-3

SELECT * FROM game as g
JOIN game_genre ON g.id = game_genre.game_id
JOIN genre ON game_genre.genre_id = genre.id
WHERE genre.slug = "FPS"
ORDER BY g.published_at;

-- 4-4

SELECT SUM(game_time) AS game_time, a.name FROM library as l
JOIN account AS a ON a.id = l.account_id
GROUP BY l.account_id;

-- 4-5

SELECT CONCAT(COUNT(IF(l.installed, 1, NULL)), '/', COUNT(l.game_id)) AS nb_games_installed, a.name FROM library as l
JOIN account AS a ON a.id = l.account_id
GROUP BY l.account_id;

-- 4-6

SELECT SUM(g.price) AS sum_game_prices, a.name FROM library as l
JOIN account AS a ON a.id = l.account_id
JOIN game AS g ON l.game_id = g.id
GROUP BY l.account_id;

-- 4-7

SELECT nickname, COUNT(id) FROM account GROUP BY nickname HAVING COUNT(id) > 1;

-- 4-8

SELECT COUNT(game_id), g.name FROM library AS l
JOIN game AS g ON l.game_id = g.id
GROUP BY game_id;

-- 4-9

SELECT g.price * COUNT(game_id) AS revenu, p.name AS publisher FROM library AS l
JOIN game AS g ON l.game_id = g.id
JOIN publisher as p ON g.publisher_id = p.id
GROUP BY g.publisher_id;

-- 4-10

SELECT COUNT(l.game_id) AS sum_game_prices, genre.name FROM library as l
JOIN game AS g ON l.game_id = g.id
JOIN game_genre ON g.id = game_genre.game_id
JOIN genre ON game_genre.genre_id = genre.id
GROUP BY genre.name;

# 4983,Action
# 3291,Aventure
# 458,Battle Royale
# 460,Cartes
# 3596,FPS
# 502,Hack 'n' Slash
# 1225,MMO
# 940,MOBA
# 722,Monde ouvert
# 1692,RPG
# 668,Simulation
# 1674,Stratégie

-- 4-11

SELECT COUNT(game_id) AS nb_sales, g.name FROM library AS l
JOIN game AS g ON l.game_id = g.id
GROUP BY game_id ORDER BY nb_sales DESC LIMIT 3;

-- 4-12

SELECT SUM(game_time) AS sum_time_played, g.name FROM library AS l
JOIN game AS g ON l.game_id = g.id
GROUP BY game_id ORDER BY sum_time_played DESC LIMIT 3;

-- 4-13

SELECT YEAR(g.published_at) AS year, GROUP_CONCAT(g.name SEPARATOR ', ') AS games FROM game AS g GROUP BY YEAR(g.published_at);

-- 4-14

SELECT * FROM game AS g ORDER BY g.published_at ASC LIMIT 1;

-- 4-15

SELECT g.name, ROUND(AVG(c.rank), 2) AS avg_rank FROM game AS g
JOIN comment AS c ON c.game_id = g.id
GROUP BY g.id ;

-- 4-16

SELECT g.name, ROUND(AVG(c.rank), 2) AS avg_rank FROM game AS g
JOIN comment AS c ON c.game_id = g.id
GROUP BY g.id ORDER BY avg_rank LIMIT 1;

-- 4-17

SELECT g.name, ROUND(AVG(c.rank), 2) AS avg_rank FROM game AS g
JOIN comment AS c ON c.game_id = g.id
GROUP BY g.id
HAVING AVG(c.rank) > (SELECT AVG(c.rank) FROM comment AS c);

-- 4-18

SELECT SUM(l.game_id) AS sum_games_owned, a.name FROM library as l
JOIN account AS a ON a.id = l.account_id
GROUP BY l.account_id HAVING SUM(l.game_id) = 0;

-- 4-19 ACTION

SELECT COUNT(l.game_id) AS sum_game_prices, genre.name FROM library as l
JOIN game AS g ON l.game_id = g.id
JOIN game_genre ON g.id = game_genre.game_id
JOIN genre ON game_genre.genre_id = genre.id
GROUP BY genre.name
ORDER BY sum_game_prices DESC LIMIT 1;

-- 4-20 BRO JE SAIS PAS

SELECT a.name, COUNT(gc.game_id), g.name FROM library as l
JOIN account AS a ON a.id = l.account_id
JOIN game AS g ON l.game_id = g.id
JOIN game_country AS gc ON gc.game_id = g.id
WHERE a.country_id != gc.country_id
GROUP BY l.account_id;

-- 4-21

SELECT country_id, (COUNT(country_id)/(SELECT COUNT(*) FROM account))*100 FROM account group by country_id;

-- 4-22

DELETE FROM library WHERE id =
(SELECT l.id
FROM library AS l
GROUP BY game_id, account_id
HAVING COUNT(*) > 1);

-- 4-23

SELECT a.name, g.id, GROUP_CONCAT(DISTINCT (SELECT l.game_id FROM library AS l2 WHERE l2.account_id = a.id GROUP BY l2.account_id)) AS games_owned, c.content FROM comment AS c
JOIN account AS a ON c.account_id = a.id
JOIN game AS g ON c.game_id = g.id
JOIN library AS l ON a.id = l.account_id
WHERE c.game_id != ALL (SELECT l3.game_id FROM library AS l3 WHERE l3.account_id = a.id) AND c.account_id = a.id
GROUP BY l.account_id;

-- 4-24

SELECT g.name, SUM(c.down_votes), SUM(c.up_votes), ROUND(AVG(c.rank), 2) AS avg_rank FROM game AS g
JOIN comment AS c ON g.id = c.game_id
GROUP BY g.id
HAVING SUM(c.down_votes) > SUM(c.up_votes) AND AVG(c.rank) > (SELECT AVG(rank) FROM comment);