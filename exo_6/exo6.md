### 1

```sql
SELECT
al.name AS "Nom de l'album",
ar.name AS "Nom de l'artiste",
al.published_at
FROM `album` AS al
JOIN artist AS ar ON ar.id = al.artist_id
ORDER BY al.published_at DESC
LIMIT 9
```


### 2

```sql
SELECT
ar.name AS "Nom Artiste",
al.name AS "Nom Album",
YEAR(al.published_at) AS "Année de sortie"
FROM `album` AS al
JOIN artist AS ar ON ar.id = al.artist_id
ORDER BY ar.name, al.published_at DESC
```


### 3

```sql
SELECT 
a.name,
COUNT(p.account_id) AS "Nombre de playlists"
FROM `playlist` AS p
JOIN account AS a ON a.id = p.account_id
GROUP BY a.name
```


### 4

```sql
SELECT 
a.name AS "Nom Album",
SEC_TO_TIME(SUM(sg.duration)) AS "Durée totale",
COUNT(sg.id) AS "Nombre de chansons"
FROM `album` AS a
JOIN album_song AS asg ON asg.album_id = a.id
JOIN song AS sg ON sg.id = asg.song_id
```


### 5

```sql
SELECT 
name,
created_at
FROM `artist` 
WHERE YEAR(created_at) = (
    SELECT MIN(YEAR(created_at))
    FROM artist
    )
```


### 6

```sql
SELECT 
AVG(YEAR(CURRENT_DATE)-YEAR(birth_date)) AS "Âge moyen des utilisateurs"
FROM `account`
```


### 7

```sql
SELECT 
SUM(newsletter) AS "Nombre d'abonnés",
gender,
CASE
	WHEN gender = 'F' THEN 'Femme'
	WHEN gender = 'H' THEN 'Homme'
	WHEN gender = 'NB' THEN 'Non-Binaire'
	WHEN gender = 'NR' THEN 'Non renseigné'
END AS "genre"
FROM `account`
GROUP BY gender
```


### 8

Il existe pas :c


### 9

```sql
SELECT
s.name,
COUNT(asu.subscription_id) AS "Nombre d'abonnés"
FROM `subscription` AS s
JOIN account_subscription AS asu ON asu.subscription_id = s.id
WHERE YEAR(asu.effective_at) = 2021
GROUP BY s.name
```


### 10

```sql
SELECT
a.name
FROM `account` AS a
LEFT JOIN playlist AS p ON p.account_id = a.id
WHERE p.account_id IS null
```


### 11

```sql
SELECT
p.name AS "Nom playlist",
a.name AS "Nom propriétaire",
COUNT(alp.account_id) AS "Nombre de like"
FROM `playlist` AS p
JOIN account AS a ON a.id = p.account_id
JOIN account_like_playlist AS alp ON alp.account_id = a.id
GROUP BY p.name
ORDER BY COUNT(alp.account_id) DESC
```


### 12

```sql
SELECT
a.name,
COUNT(p.account_id) AS "Nombre de playlists créées"
FROM `account` AS a
LEFT JOIN playlist AS p ON p.account_id = a.id
GROUP BY a.name
```


### 13

```sql

```


### 14

```sql

```


### 15

```sql

```


### 16

```sql

```