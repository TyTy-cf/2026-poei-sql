
-- 1/ Afficher les jeux (table : games), triés par ordre de date de sortie (publishedAt)
SELECT *, published_at FROM game ORDER BY published_at

-- 2/ Afficher TOUS les jeux les plus cher (ceux ayant le prix maximum)
SELECT *
FROM game
WHERE price = (SELECT MAX(price) FROM game)


-- 3/ En reprenant la requête de la question 1, afficher uniquement les jeux ayant au moins le style FPS
SELECT *, published_at 
FROM game 
JOIN game_genre ON game.id = game_genre.game_id
JOIN genre ON game_genre.genre_id = genre.id
WHERE genre.name = 'FPS'
ORDER BY published_at

-- 4/ Affichez le temps de jeu total par nom de compte
SELECT 
    SUM(l.game_time) AS total_game_time,
    a.name AS account_name
FROM library l 
JOIN account a ON l.account_id = a.id
GROUP BY a.name
ORDER BY total_game_time DESC


-- 5/ Afficher par compte, le nombre de jeux installés qu'il possède, sur son nombre de jeu total (ex : 4/6 ; installed = 1)
SELECT 
    a.name AS account_name,
    SUM(l.installed) AS installed_games,
    COUNT(g.id) AS total_games
FROM library l 
JOIN account a ON l.account_id = a.id
JOIN game g ON l.game_id = g.id
GROUP BY a.name
ORDER BY installed_games DESC

-- 6/ Afficher la valeur (somme du prix des jeux) de la bibliothèque (library) d'un compte (account)
SELECT 
    SUM(g.price) AS total_price,
    a.name AS account_name
FROM library l 
JOIN account a ON l.account_id = a.id
JOIN game g ON l.game_id = g.id
GROUP BY a.name
ORDER BY total_price DESC

-- 7/ Afficher les nicknames utilisés plusieurs fois
SELECT 
    COUNT(*) AS nickname_count,
    nickname
FROM account
GROUP BY nickname
HAVING nickname_count > 1
    

-- 8/ Afficher par jeux, le nombre de fois où il a été acheté
SELECT
    COUNT(*) AS purchase_counter,
    g.*
FROM library l
JOIN game g ON l.game_id = g.id
GROUP BY g.id
ORDER BY purchase_counter DESC

-- 9/ Afficher par jeux, son revenu total à son éditeur
SELECT
    SUM(g.price) AS gross_revenue,
    g.name AS game_name,
    p.name AS publisher_name
FROM library l
JOIN game g ON l.game_id = g.id
JOIN publisher p ON g.publisher_id = p.id
GROUP BY g.id
ORDER BY gross_revenue DESC

-- 10/ Afficher par genre, son nombre de fois où il a été vendu
SELECT
    genre.name AS genre_name,
    COUNT(*) AS sell_counter,
    SUM(g.price) AS genre_revenue

FROM library l
JOIN game g ON l.game_id = g.id
JOIN game_genre ON g.id = game_genre.game_id
JOIN genre ON game_genre.genre_id = genre.id
GROUP BY genre_name
ORDER BY sell_counter DESC

-- 11/ Afficher le top 3 des jeux les plus vendu
SELECT
    COUNT(*) AS purchase_counter,
    g.*
FROM library l
JOIN game g ON l.game_id = g.id
GROUP BY g.id
ORDER BY purchase_counter DESC
LIMIT 3

-- 12/ Afficher le top 3 des jeux les plus joués (temps de jeu cumulé parmi toutes les library les plus élevé)
SELECT 
    SUM(l.game_time) AS total_game_time,
    g.name AS game_name
FROM library l 
JOIN game g ON l.game_id = g.id
GROUP BY g.id
ORDER BY total_game_time DESC
LIMIT 3

-- 13/ Afficher les différents jeux par année, sous une même colonne
SELECT 
    EXTRACT(YEAR FROM g.published_at) AS year,
    g.name AS game_name
FROM game g
ORDER BY year DESC


-- 14/ Le jeu le plus ancien
SELECT 
    EXTRACT(YEAR FROM g.published_at) AS year,
    g.name AS game_name
FROM game g
ORDER BY year ASC
LIMIT 1


-- 15/ Afficher les jeux avec leur note moyenne (table comment, colonne rank)
SELECT 
    g.name AS game_name,
    AVG(c.rank) AS average_rank
FROM comment c
JOIN game g ON c.game_id = g.id
GROUP BY g.name
ORDER BY average_rank DESC

-- 16/ Afficher le jeu ayant le plus de commentaire négatif (colonne down_votes)
SELECT 
    g.name AS game_name,
    SUM(c.down_votes) AS total_down_votes
FROM comment c
JOIN game g ON c.game_id = g.id
GROUP BY g.id
ORDER BY total_down_votes DESC
LIMIT 1

-- 17/ Afficher les jeux dont la moyenne des commentaires (rank) est supérieur à la moyenne globale
SELECT 
    g.name AS game_name,
    c.rank
FROM comment c
JOIN game g ON c.game_id = g.id
WHERE c.rank > (select AVG(rank) from comment)
GROUP BY g.id

-- 18/ Afficher les account n’ayant jamais acheté de jeu
SELECT
    a.name AS account_name
FROM account a
LEFT JOIN library l ON a.id = l.account_id
WHERE l.game_id IS NULL

-- 19/ Afficher le genre le plus acheté
SELECT
    count(*) AS purchase_counter,
    genre.name AS genre_name
FROM library l
JOIN game g ON l.game_id = g.id
JOIN game_genre ON g.id = game_genre.game_id
JOIN genre ON game_genre.genre_id = genre.id
GROUP BY genre.id
ORDER BY purchase_counter DESC
LIMIT 1

-- 20/ Afficher les noms de compte ayant acheté un jeu, qui n’est pas dans leur langue natale.
SELECT DISTINCT 
    a.nickname AS acc_nickname
FROM account a
JOIN library l ON a.id = l.account_id
WHERE a.country_id NOT IN (
    SELECT gc.country_id 
    FROM game_country gc 
    WHERE gc.game_id = l.game_id
);

-- 21/ Afficher le ratio de présence des accounts par pays dans l’application
SELECT 
    c.name as country_name,
    COUNT(DISTINCT a.id) AS acc_count,
    ROUND((COUNT(DISTINCT a.id) / (SELECT COUNT(*) FROM account)) * 100, 2) AS acc_percentage
FROM account a
JOIN library l ON a.id = l.account_id
JOIN country c ON a.country_id = c.id
GROUP BY c.name
ORDER BY acc_percentage DESC



-- 22/ Faire une requête pour supprimer les doublons de la table libraries (paire game_id et account_id)
SELECT 
    g.id as game_id,
    a.id as account_id
FROM account a 
JOIN game g ON l.game_id = g.id



-- 23/ Faire une requête pour afficher les utilisateurs qui ont mis des commentaires à des jeux non présents dans leur bibliothèque

-- 24/ Afficher les jeux dont leur total de downvote supérieur au total d'upvotes, MAIS un rank supérieur à la moyenne globale des rank de tous les commentaires.