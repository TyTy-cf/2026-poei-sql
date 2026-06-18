## 2. Requêtes

### 1/ Afficher les jeux (table : games), triés par ordre de date de sortie (publishedAt)

```sql
SELECT *

FROM game

ORDER BY game.published_at DESC;
```

### 2/ Afficher tous les jeux les plus cher (ceux ayant le prix maximum)

```sql
SELECT
	g.name,
    g.price

FROM `game` g

WHERE g.price = (
  	SELECT MAX(price)
    FROM game
);
```

### 3/ En reprenant la requête de la question 1, afficher uniquement les jeux ayant au moins le style FPS

```sql
SELECT
    g.name,
    g.published_at,
    ge.name AS "FPS"

FROM game g

         JOIN game_genre gg ON gg.game_id = g.id
         JOIN genre ge ON ge.id = gg.genre_id

WHERE ge.name = "FPS"

ORDER BY g.published_at DESC;
```

### 4/ Affichez le temps de jeu total par nom de compte

```sql
SELECT
	a.name,
	a.nickname,
    SUM(l.game_time) AS "Temps de jeux total"
    
FROM account a

JOIN library l ON l.account_id = a.id

GROUP BY a.id;
```

### 5/ Afficher par compte, le nombre de jeux installés qu'il possède, sur son nombre de jeu total (ex : 4/6 ; is_installed = 1)

```sql
SELECT
	a.name,
    CONCAT(
        (
            SELECT COUNT(*)
            FROM library lib
            WHERE lib.installed = 1
            AND lib.account_id = a.id
        ), '/',
		COUNT(l.id)
    ) AS "Jeux installés"

FROM `account` a

LEFT JOIN library l ON l.account_id = a.id

GROUP BY a.id;
```

- Alternative avec SUM :

```sql
SELECT CONCAT(SUM(library.installed), " / ", COUNT(library.installed)) AS "Nb jeux installés",
       account.name,
       account.id

FROM account

LEFT JOIN library ON account.id = library.account_id

GROUP BY account.id;
```

### 6/ Afficher la valeur (somme du prix des jeux) de la bibliothèque (library) d'un compte (account)

```sql
SELECT
       	a.name,
       	a.id,
        IF(SUM(g.price) IS NULL, 0, SUM(g.price)) AS "€"
	
FROM account a

LEFT JOIN library l ON a.id = l.account_id
LEFT JOIN game g ON g.id = l.game_id

GROUP BY a.id;
```

### 7/ Afficher les nicknames utilisés plusieurs fois

```sql
SELECT
       	a.id,
       	a.nickname,
        COUNT(*) AS nb_use
	
FROM account a

GROUP BY a.nickname

HAVING nb_use > 1;
```

### 8/ Afficher par jeux, le nombre de fois où il a été acheté

```sql
SELECT 	g.name,
          COUNT(l.id) AS "Nb fois vendu"

FROM game g 

LEFT JOIN library l ON l.game_id = g.id

GROUP BY g.id;
```

### 9/ Afficher par jeux, son revenu total à son éditeur

```sql
SELECT 	p.name,
        SUM(g.price) AS "CA Editeur"

FROM game g 

LEFT JOIN library l ON l.game_id = g.id
JOIN publisher p ON p.id = g.publisher_id

GROUP BY p.id;
```

### 10/ Afficher par genre, son nombre de fois où il a été vendu

```sql
SELECT 	ge.name,
        COUNT(l.id) AS "Nb fois vendu"

FROM genre ge

 LEFT JOIN game_genre gg ON gg.genre_id = ge.id
 LEFT JOIN game g ON g.id = gg.game_id
 LEFT JOIN library l ON l.game_id = g.id

GROUP BY ge.id;
```

### 11/ Afficher le top 3 des jeux les plus vendu

```sql
SELECT 	g.name,
          COUNT(l.id) AS "Nb fois vendu"

FROM game g 

LEFT JOIN library l ON l.game_id = g.id

GROUP BY g.id

ORDER BY COUNT(l.id) DESC

LIMIT 3;
```

### 12/ Afficher le top 3 des jeux les plus joués (temps de jeu cumulé parmi toutes les library les plus élevé)

```sql
SELECT 	g.name,
        SUM(l.game_time) AS played

FROM game g 

LEFT JOIN library l ON l.game_id = g.id

GROUP BY g.id

ORDER BY played DESC

LIMIT 3;
```

### 13/ Afficher les différents jeux par année, sous une même colonne

```sql
SELECT
	YEAR(g.published_at) AS year,
    GROUP_CONCAT(g.name, ' ') AS games

FROM game g

GROUP BY year

ORDER BY year DESC;
```

### 14/ Le jeu le plus ancien

```sql
SELECT *
FROM `game`
ORDER BY published_at ASC
LIMIT 1;
```

### 15/ Afficher les jeux avec leur note moyenne (table comment, colonne rank)

```sql
SELECT
	g.name,
    ROUND(AVG(c.rank), 2) AS avg_rank

FROM `game` g

LEFT JOIN comment c ON c.game_id = g.id

GROUP BY g.id 
ORDER BY `avg_rank` DESC 
```

### 16/ Afficher le jeu ayant le plus de commentaire négatif (colonne down_votes)

```sql
SELECT
	g.name,
    SUM(c.down_votes) AS sum_downvote

FROM `game` g

LEFT JOIN comment c ON c.game_id = g.id

GROUP BY g.id

ORDER BY sum_downvote DESC
LIMIT 1;
```

### 17/ Afficher les jeux dont la moyenne des commentaires (rank) est supérieur à la moyenne globale

```sql
SELECT
	g.name,
    ROUND(AVG(c.rank), 2) AS avg_rank

FROM `game` g

LEFT JOIN comment c ON c.game_id = g.id

GROUP BY g.id

HAVING avg_rank > (
    SELECT AVG(rank)
    FROM comment
)

ORDER BY `avg_rank` DESC 
```

### 18/ Afficher les account n’ayant jamais acheté de jeu

```sql
SELECT account.name,
       account.id

FROM account

LEFT JOIN library ON account.id = library.account_id

WHERE library.account_id IS NULL;
```

- Alternative :

```sql
SELECT account.name,
       account.id

FROM account

WHERE account.id NOT IN (
    SELECT DISTINCT l.account_id
    FROM library l
);
```

### 19/ Afficher le genre le plus acheté

```sql
SELECT 	ge.name,
        COUNT(l.id) AS nb_times_sold

FROM genre ge

 LEFT JOIN game_genre gg ON gg.genre_id = ge.id
 LEFT JOIN library l ON l.game_id = gg.game_id

GROUP BY ge.id

ORDER BY nb_times_sold DESC

LIMIT 1;
```

**STOP ICI**

---

### 20/ Afficher les noms de compte ayant acheté un jeu, qui n’est pas dans leur langue natale.

### 21/ Afficher le ratio de présence des accounts par pays dans l’application

### 22/ Faire une requête pour supprimer les doublons de la table libraries (paire game_id et account_id)

### 23/ Faire une requête pour afficher les utilisateurs qui ont mis des commentaires à des jeux non présents dans leur bibliothèque

### 24/ Afficher les jeux dont leur total de downvote supérieur au total d'upvotes, MAIS un rank supérieur à la moyenne globale des rank de tous les commentaires