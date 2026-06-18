## 2. Requêtes

### 1. Afficher les 9 derniers album sortis, avec le nom de l’album, le nom de l’artiste et seulement son année de sortie

```sql
SELECT
	a.name AS album_name,
    ats.name AS artist_name,
    YEAR(a.published_at) AS published_at

FROM album a

JOIN artist ats ON ats.id = a.artist_id

ORDER BY a.published_at DESC
LIMIT 9;
```

### 2. Afficher tous les artistes avec :
- Le nom de leur album
- L’année de sortie
- On doit voir seulement les colonnes suivantes : « Nom artiste | Nom album | Année de sortie » et trié par nom d’artiste et année de sortie.

```sql
SELECT
    ats.name AS artist_name,
	a.name AS album_name,
    YEAR(a.published_at) AS published_at

FROM album a

JOIN artist ats ON ats.id = a.artist_id

ORDER BY ats.name, published_at ASC;
```

### 3. Afficher le nombre de playlist créée par compte utilisateur (account)

```sql
SELECT
	a.id,
	a.name,
    COUNT(p.id) AS nb_playlists

-- On part depuis la table account car on souhaite afficher "0" pour les utilisateurs n'ayant PAS créer de playlist
FROM account a

-- LEFT JOIN pour justement récupérer TOUT les utilisateurs, même ceux qui n'ont pas créé de playlist
LEFT JOIN playlist p ON p.account_id = a.id

GROUP BY a.id;
```

### 4. Afficher par album, la durée totale de celui-ci en seconde et son nombre de chansons, on doit voir : « Nom album | Durée totale | Nombre de chansons »
Bonus : afficher la durée en hh :mm :ss

```sql
SELECT
	a.id,
	art.name AS "Artiste",
    a.name AS "Non album",
	SEC_TO_TIME(SUM(s.duration)) AS "Durée totale",
	COUNT(*) AS "Nb chansons"

FROM album a

-- L'ordre importe ici : on doit d'abords joindre les tables étant en relation à album
-- Pas de LEFT JOIN ici, car à priori, toutes les relations depuis album sont obligatoires
JOIN artist art ON art.id = a.artist_id
JOIN album_song aso ON aso.album_id = a.id
JOIN song s ON s.id = aso.song_id

GROUP BY a.id;
```

### 5. Afficher le(s) nom(s) de(s) artiste(s) les plus vieux, et seulement sur l’année. Par exemple, s’il y a 2 artistes en 1976 et que c’est l’année la plus basse, je veux voir les deux (on ignore le jours et le mois)

```sql
SELECT
	a.id,
	a.name,
    YEAR(a.created_at) AS created_at

FROM artist a

-- Utiliser IN oui = revient au même dans ce cas de figure
-- Généralement "IN" pour les sous requêtes, SI JAMAIS elles renvoient PLUSIEURS résultats
-- Là ce n'est pas le cas, un = suffirait amplement
WHERE YEAR(a.created_at) IN (
    SELECT MIN(YEAR(created_at))
    FROM artist
);
```

### 6. Afficher l’âge moyen des utilisateurs de l’application. Formule de calcul : année actuelle – année de « birth_date » de l’utilisateur

```sql
SELECT
	ROUND(AVG(YEAR(NOW()) - YEAR(a.birth_date)), 2) AS avg_age

FROM account a;
```

### 7. Afficher le nombre d’abonnés à la newsletter (colonne newsletter = 1 de la table account)

```sql
SELECT
	COUNT(*) AS nb_newsletter_sub

FROM `account` a

WHERE a.newsletter = 1;
```

### 8. Afficher le nombre d’utilisateur par genre
Bonus : labellisé les acronymes par leur signification : <br>
- « F » = Femme <br>
- « H » = Homme <br>
- « NB » = Non-binaire <br>
- « NR » = Non-renseigné

```sql
SELECT
	IF(
        a.gender = 'F',
        "Femme",
        IF(
            a.gender = 'H',
            "Homme",
            IF(
                a.gender = 'NB',
                "Non-binaire",
                "Non-renseigné"
            )
        )
    ) AS gender,         
	COUNT(*) AS nb

FROM `account` a

GROUP BY a.gender;
```

### 9. Afficher par abonnement (table « subscription »), le nombre de fois où un abonnement a été actif sur l’année 2021
- Un abonnement débutant en 2017 et étant toujours actif, a donc été actif en 2021
- Un abonnement débutant en 2018 et s'étant arrêté en 2022, a donc été actif en 2021
- Un abonnement débutant en 2018 et s'étant arrêté en 2021, a donc été actif en 2021
- Un abonnement débutant en 2018 et s'étant arrêté en 2020, n'a donc pas été actif en 2021

```sql
SELECT
	s.name,
    COUNT(asub.id) AS nb_time

FROM subscription s

LEFT JOIN account_subscription asub ON asub.subscription_id = s.id

WHERE asub.id IS NULL
OR (
    YEAR(asub.effective_at) <= 2021
    AND (
        asub.finished_at IS NULL
        OR
        YEAR(asub.finished_at) >= 2021
    )
)

GROUP BY s.id;
```

### 10. Afficher les utilisateurs n’ayant jamais créer de playlists

```sql
SELECT
    a.id,
    a.name

FROM account a

LEFT JOIN playlist p ON a.id = p.account_id

WHERE p.id IS NULL;
```

### 11. Afficher le nombre de like par playlist, avec le nom du propriétaire de la playlist, on doit voir :
    « Nom playlist | Nom propriétaire | Nombre de like »
    Il faut passer par la table « account_like_playlist »

```sql
SELECT
    p.id,
    p.name,
    a.id AS creator_id,
    a.name AS creator_name,
    COUNT(alp.playlist_id) AS nb_likes

FROM playlist p

-- Récupère le créateur de la playlist
JOIN account a ON a.id = p.account_id

-- On va chercher le nombre de fois où p.id est présent dans account_like_playlist
LEFT JOIN account_like_playlist alp ON alp.playlist_id = p.id

GROUP BY p.id;
```

### 12. Afficher la durée total des playlists publiques

```sql
SELECT
    p.id,
    p.name,
    IF(
        SEC_TO_TIME(SUM(s.duration)) IS NULL,
        "00:00:00",
        SEC_TO_TIME(SUM(s.duration))
    ) AS "Durée totale"

FROM playlist p

         LEFT JOIN playlist_song ps ON ps.playlist_id = p.id
         LEFT JOIN song s ON s.id = ps.song_id

GROUP BY p.id;
```

### 13. Afficher l'âge de chaque utilisateur

```sql
SELECT
	a.id,
    a.name,
    a.birth_date,
    YEAR(NOW()) - YEAR(a.birth_date) AS age
	
FROM account a;
```

### 14. Comptez le nombre d'utilisateur étant inscrit avec une adresse mail "gmail"

```sql
SELECT
    COUNT(*) AS nb
	
FROM account a

WHERE a.email LIKE "%gmail%";
```

### 15. Afficher le nombre d'utilisateur inscrit depuis 2020 et plus

```sql
SELECT
    COUNT(*) AS nb

FROM account a

WHERE YEAR(a.created_at) >= 2020;
```

### 16. Afficher pour les abonnements **terminés** combien ont-ils rapportés à la plateforme (on affiche seulement les gains totaux pour tous les abonnements)
    
```sql
SELECT
    s.name,
    ROUND((SUM(TIMESTAMPDIFF(MONTH, asub.effective_at, asub.finished_at)) * s.cost) / 100, 2) AS gain

FROM subscription s

 LEFT JOIN account_subscription asub ON asub.subscription_id = s.id

WHERE (asub.id IS NULL OR asub.finished_at IS NOT NULL)

GROUP BY s.id;
```
