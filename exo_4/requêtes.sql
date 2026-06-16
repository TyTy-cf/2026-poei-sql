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
GROUP BY l.account_id ORDER BY game_time DESC;

-- 4-5 Pas sur de comprendre

# SELECT CONCAT(COUNT()) AS game_time, a.name FROM library as l
# JOIN account AS a ON a.id = l.account_id
# GROUP BY l.account_id ORDER BY game_time DESC;

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

