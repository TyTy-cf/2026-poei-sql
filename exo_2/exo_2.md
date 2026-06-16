### 1

```sql
SELECT * 
FROM `pokemon` 
WHERE is_default = 0
```


### 2

```sql
SELECT AVG(hp + atk + def + spa + spd + spe) 
FROM `pokemon`
GROUP BY id
```


### 3

```sql
SELECT *
FROM `pokemon`
ORDER BY weight DESC
LIMIT 1
```


### 4

```sql
SELECT *
FROM `pokemon`
ORDER BY height
LIMIT 1
```


### 5

```sql
SELECT *
FROM `pokemon`
ORDER BY spe
LIMIT 1
```


### 6

```sql
SELECT *
FROM `pokemon`
WHERE atk > 150
ORDER BY atk DESC 
```


### 7

```sql
SELECT name,
(hp+atk+def+spa+spd+spe) AS "total stats"
FROM `pokemon`
```


### 8

```sql
SELECT *
FROM `pokemon`
WHERE `slug` = `name_api`
```


### 9

```sql
SELECT *
FROM `pokemon`
WHERE name LIKE "%Mew%"
```


### 11

```sql
SELECT *
FROM `pokemon`
WHERE length(name) <= 3
```


### 12

```sql
SELECT name,
       (hp+atk+def+spa+spd+spe) AS total_stats
FROM `pokemon`
ORDER BY total_stats DESC
LIMIT 1
```


### 13

```sql
SELECT *
FROM `pokemon`
ORDER BY base_experience
LIMIT 1
```


### 14

```sql
SELECT `id`, `weight`, `height`, `base_experience`, `hp`, `atk`, `def`, `spa`, `spd`, `spe`, `name`, `slug`, `id_api`, `name_api`, `is_default`,
CONCAT(ROUND((base_experience/(hp+atk+def+spa+spd+spe))*100,2),"%") AS efficace
FROM `pokemon`
```