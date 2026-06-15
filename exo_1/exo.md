### 1

```sql
SELECT last_name,
       first_name
FROM `students`
```


### 2

```sql
SELECT *
FROM `students`
WHERE
sex = 'M' AND height < 160
OR
sex = 'F' AND height > 160
```


### 3

```sql
SELECT min(height)
FROM `students`
```


### 4

```sql
SELECT AVG(height)
FROM `students`
WHERE sex = 'M'
```


### 5

```sql
SELECT COUNT(*) AS "Nombre d'étudiantes femme"
FROM `students`
WHERE sex = 'F';

SELECT COUNT(*) AS "Nombre d'étudiants homme"
FROM `students`
WHERE sex = 'M';
```


### 6

```sql
SELECT COUNT(*) AS "Nombre d'étudiantes femme"
FROM `students`
WHERE sex = 'F'
AND height < 160;

SELECT COUNT(*) AS "Nombre d'étudiants homme"
FROM `students`
WHERE sex = 'M'
AND height > 160;
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