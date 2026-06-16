### 1

```sql
SELECT name,
       published_at
FROM `game`
ORDER BY published_at
```


### 2

```sql
SELECT name,
price
FROM `game`
WHERE 
price = (SELECT 
         MAX(price)
         FROM game)
```


### 3

```sql
SELECT ga.name,
       published_at
FROM `game` AS ga
JOIN game_genre AS gg ON gg.game_id = ga.id
JOIN genre AS ge ON ge.id = gg.genre_id
WHERE ge.name = 'FPS'
ORDER BY published_at
```


### 4

```sql
SELECT 
SUM(l.game_time) AS "Heures de jeu total",
a.name
FROM `library` AS l
JOIN account AS a ON a.id = l.account_id
GROUP BY a.name
```


### 5

```sql
SELECT 
a.name,
CONCAT(SUM(l.installed),'/',COUNT(l.installed))
FROM `library` AS l
JOIN account AS a ON a.id = l.account_id
GROUP BY a.name
```


### 6

```sql
SELECT 
SUM(g.price),
a.name
FROM `library` AS l
JOIN game AS g ON g.id = l.game_id
JOIN account AS a ON a.id = l.account_id
GROUP BY a.name
```


### 7

```sql
SELECT COUNT(nickname) AS c,
       nickname
FROM `account`
GROUP by nickname
HAVING c > 1
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


### 17

```sql

```


### 18

```sql

```


### 19

```sql

```


### 20

```sql

```


### 21

```sql

```


### 22

```sql

```


### 23

```sql

```


### 24

```sql

```