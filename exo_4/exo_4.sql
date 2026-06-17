
### 1/ Afficher les jeux (table : games), triés par ordre de date de sortie (publishedAt)

SELECT * 

FROM game g

 ORDER BY published_at DESC;

### 2/ Afficher tous les jeux les plus cher (ceux ayant le prix maximum)

SELECT g.name,g.price
FROM game g
WHERE 
(SELECT MAX(price) FROM game g

);

### 3/ En reprenant la requête de la question 1, afficher uniquement les jeux ayant au moins le style FPS

SELECT  g.id,g.name

FROM game g

JOIN game_genre gg ON g.id = gg.game_id

JOIN genre gr ON gg.genre_id = gr.id

WHERE gr.name = 'FPS'

ORDER BY g.published_at desc ;


### 4/ Affichez le temps de jeu total par nom de compte

SELECT  a.*,SUM(l.game_time) AS total_time
FROM account a
JOIN library l ON a.id = l.account_id
GROUP BY a.name;


### 5/ Afficher par compte, le nombre de jeux installés qu'il possède, sur son nombre de jeu total (ex : 4/6 ; is_installed = 1)

SELECT a.*, CONCAT(.....,'/',COUNT(l.installed) )
FROM account a
JOIN library l ON a.id = l.account_id
ORDER BY a.name;

### 6/ Afficher la valeur (somme du prix des jeux) de la bibliothèque (library) d'un compte (account)


SELECT  a.name,SUM(g.price)
FROM account a
JOIN library l ON a.id = l.account_id
JOIN game  g ON  g.id = l.game_id
GROUP BY a.name;


### 7/ Afficher les nicknames utilisés plusieurs fois

SELECT a.nicknames 
FROM account a
GROUP BY a.nicknames
HAVING COUNT(*) > 1;


### 8/ Afficher par jeux, le nombre de fois où il a été acheté

SELECT g.name, COUNT(l.account_id)
FROM game g
JOIN library l ON  g.id = l.game_id
GROUP BY g.name


### 9/ Afficher par jeux, son revenu total à son éditeur
SELECT g.name, SUM(g.price)
FROM game g
JOIN library l ON g.id = l.game_id
GROUP BY g.name


### 10/ Afficher par genre, son nombre de fois où il a été vendu

SELECT gr.name , COUNT(l.account_id)
FROM genre gr
join game_genre gg on gr.id = gg.genre_id
join library l on gg.game_id = l.game_id
GROUP by gr.name;


### 11/ Afficher le top 3 des jeux les plus vendu


select g.name , COUNT(l.account_id) AS total_ventes
FROM game g
join library l ON g.id = l.game_id
GROUP by g.name
ORDER BY total_ventes DESC
limit 3;


### 12/ Afficher le top 3 des jeux les plus joués (temps de jeu cumulé parmi toutes les library les plus élevé)

SELECT g.name
FROM game g
JOIN library l ON g.id = l.game_id
ORDER BY l.game_time DESC
LIMIT 3;

### 13/ Afficher les différents jeux par année, sous une même colonne

SELECT CONCAT(g.name,'/',YEAR(g.published_at)) 
FROM  game g
GROUP BY YEAR(g.published_at)
ORDER by YEAR(g.published_at) DESC;

### 14/ Le jeu le plus ancien
 SELECT g.*
 FROM game g
 ORDER BY published_at  ASC
 limit 1;


### 15/ Afficher les jeux avec leur note moyenne (table comment, colonne rank)

SELECT g.name , AVG(C.RA)
FROM game g
JOIN  comment c on g.id = c.game_id
GROUP BY g.name ;


### 16/ Afficher le jeu ayant le plus de commentaire négatif (colonne down_votes)

select g.name , SUM(c.down_votes) as best_comment
FROM game g 
join comment c on g.id = c.game_id
GROUP BY g.name
ORDER by best_comment
LIMIT 1 ;



### 17/ Afficher les jeux dont la moyenne des commentaires (rank) est supérieur à la moyenne globale

SELECT g.name 
FROM game g
JOIN comment c ON g.id = c.game_id
WHERE
(SELECT  AVG(c.rank)  FROM comment c)
GROUP BY g.name;





### 18/ Afficher les account n’ayant jamais acheté de jeu


SELECT a.name , l.installed
FROM account a
LEFT JOIN library l ON a.id = l.account_id
LEFT JOIN game g ON  l.game_id = g.id
WHERE  l.installed IS NULL;


### 19/ Afficher le genre le plus acheté



### 20/ Afficher les noms de compte ayant acheté un jeu, qui n’est pas dans leur langue natale.

### 21/ Afficher le ratio de présence des accounts par pays dans l’application

### 22/ Faire une requête pour supprimer les doublons de la table libraries (paire game_id et account_id)

### 23/ Faire une requête pour afficher les utilisateurs qui ont mis des commentaires à des jeux non présents dans leur bibliothèque

### 24/ Afficher les jeux dont leur total de downvote supérieur au total d'upvotes, MAIS un rank supérieur à la moyenne globale des rank de tous les commentaires. un event, qui supprime les utilisateurs qui ont plus de 5 ans dans l’application et qui n’ont pas acheté de jeu.