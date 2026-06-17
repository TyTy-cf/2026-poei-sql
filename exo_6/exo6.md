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
SUM(sg.duration) AS "Durée totale",
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

```


### 8

```sql

```


### 9

```sql

```


### 10

```sql

```


### 11

```sql

```


### 12

```sql

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