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
GROUP BY weight DESC
LIMIT 1
```


### 4

```sql
SELECT *
FROM `pokemon`
GROUP BY height
LIMIT 1
```


### 5

```sql
SELECT *
FROM `pokemon`
GROUP BY spe
LIMIT 1
```


### 6

```sql
SELECT *
FROM `pokemon`
WHERE atk > 150
GROUP BY atk DESC 
```


### 7

```sql
SELECT name,
(hp+atk+def+spa+spd+spe) AS "total stats"
FROM `pokemon`
```


### 8

```sql

```


### 9

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