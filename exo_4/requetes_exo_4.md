### 1/ Afficher les jeux (table : games), triés par ordre de date de sortie (publishedAt)

```sql
SELECT *
FROM game
ORDER BY published_at ASC;
```

### 2/ Afficher tous les jeux les plus cher (ceux ayant le prix maximum)

```sql
SELECT game.name, game.price
FROM game
WHERE price = (SELECT MAX(price) FROM game);
```

### 3/ En reprenant la requête de la question 1, afficher uniquement les jeux ayant au moins le style FPS

```sql
SELECT game.name, game.published_at, genre.name
FROM game
         JOIN game_genre ON game.id = game_genre.game_id
         JOIN genre ON game_genre.genre_id = genre.id
WHERE genre.name = 'FPS'
ORDER BY game.published_at ASC;
```

### 4/ Affichez le temps de jeu total par nom de compte

```sql
SELECT account.name, SUM(library.game_time) AS total_playtime
FROM account
         JOIN library ON account.id = library.account_id
GROUP BY account.id;
```

### 5/ Afficher par compte, le nombre de jeux installés qu'il possède, sur son nombre de jeu total (ex : 4/6 ; is_installed = 1)

```sql
SELECT a.name,
       CONCAT(SUM(l.installed), '/', COUNT(l.id)) AS installed_ratio
FROM account a
         LEFT JOIN library l ON a.id = l.account_id
GROUP BY a.id;
```

### 6/ Afficher la valeur (somme du prix des jeux) de la bibliothèque (library) d'un compte (account)

```sql
SELECT a.name, IF(SUM(g.price) IS NULL, 0, SUM(g.price)) AS library_value
FROM account a
         LEFT JOIN library l ON a.id = l.account_id
         LEFT JOIN game g ON l.game_id = g.id
GROUP BY a.id
ORDER BY `library_value` DESC 
```

### 7/ Afficher les nicknames utilisés plusieurs fois

```sql
SELECT nickname, COUNT(*)
FROM account
GROUP BY nickname
HAVING COUNT(*) > 1;
```

### 8/ Afficher par jeux, le nombre de fois où il a été acheté

```sql
SELECT g.name, COUNT(l.id) AS purchase_count
FROM game g
         LEFT JOIN library l ON g.id = l.game_id
GROUP BY g.id;
```

### 9/ Afficher par jeux, son revenu total à son éditeur

```sql
SELECT g.name, (COUNT(l.id) * g.price) AS total_revenue
FROM game g
         LEFT JOIN library l ON g.id = l.game_id
GROUP BY g.id;
```

```sql
SELECT p.name,
       SUM(g.price) AS "CA Editeur"
FROM game g
         LEFT JOIN library l ON g.id = l.game_id
         JOIN publisher p ON p.id = g.publisher_id
GROUP BY p.id;
```

### 10/ Afficher par genre, son nombre de fois où il a été vendu

```sql
SELECT ge.name, COUNT(l.id) AS sales_count
FROM genre ge
         JOIN game_genre gg ON ge.id = gg.genre_id
         JOIN library l ON gg.game_id = l.game_id
GROUP BY ge.id;
```

### 11/ Afficher le top 3 des jeux les plus vendu

```sql
SELECT g.name, COUNT(l.id) AS sales_count
FROM game g
         JOIN library l ON g.id = l.game_id
GROUP BY g.id
ORDER BY sales_count DESC LIMIT 3;
```

### 12/ Afficher le top 3 des jeux les plus joués (temps de jeu cumulé parmi toutes les library les plus élevé)

```sql
SELECT g.name, SUM(l.game_time) AS total_time
FROM game g
         JOIN library l ON g.id = l.game_id
GROUP BY g.id
ORDER BY total_time DESC LIMIT 3;
```

### 13/ Afficher les différents jeux par année, sous une même colonne

```sql
SELECT YEAR (published_at) AS year, GROUP_CONCAT(name) AS games
FROM game
GROUP BY year;
```

### 14/ Le jeu le plus ancien

```sql
SELECT *
FROM game
ORDER BY published_at ASC LIMIT 1;
```

### 15/ Afficher les jeux avec leur note moyenne (table comment, colonne rank)

```sql
SELECT g.name, ROUND(AVG(c.rank), 2) AS average_rank
FROM game g
         LEFT JOIN comment c ON g.id = c.game_id
GROUP BY g.id;
```

### 16/ Afficher le jeu ayant le plus de commentaire négatif (colonne down_votes)

```sql
SELECT g.name, SUM(c.down_votes) AS total_downvotes
FROM game g
         JOIN comment c ON g.id = c.game_id
GROUP BY g.id
ORDER BY total_downvotes DESC LIMIT 1;
```

### 17/ Afficher les jeux dont la moyenne des commentaires (rank) est supérieur à la moyenne globale

```sql
SELECT g.name, ROUND(AVG(c.rank), 2) AS avg_rank
FROM game g
         JOIN comment c ON g.id = c.game_id
GROUP BY g.id
HAVING avg_rank > (SELECT AVG(rank) FROM comment)
ORDER BY avg_rank DESC;
```

### 18/ Afficher les account n’ayant jamais acheté de jeu

```sql
SELECT a.name
FROM account a
         LEFT JOIN library l ON a.id = l.account_id
WHERE l.id IS NULL;
```

### 19/ Afficher le genre le plus acheté

```sql
SELECT ge.name, COUNT(l.id) AS total_sales
FROM genre ge
         JOIN game_genre gg ON ge.id = gg.genre_id
         JOIN library l ON gg.game_id = l.game_id
GROUP BY ge.id
ORDER BY total_sales DESC LIMIT 1;
```

### 20/ Afficher les noms de compte ayant acheté un jeu, qui n’est pas dans leur langue natale.

```sql

```

### 21/ Afficher le ratio de présence des accounts par pays dans l’application

```sql

```

### 22/ Faire une requête pour supprimer les doublons de la table libraries (paire game_id et account_id)

```sql

```

### 23/ Faire une requête pour afficher les utilisateurs qui ont mis des commentaires à des jeux non présents dans leur bibliothèque

```sql

```

### 24/ Afficher les jeux dont leur total de downvote supérieur au total d'upvotes, MAIS un rank supérieur à la moyenne globale des rank de tous les commentaires. un event, qui supprime les utilisateurs qui ont plus de 5 ans dans l’application et qui n’ont pas acheté de jeu.

```sql

```