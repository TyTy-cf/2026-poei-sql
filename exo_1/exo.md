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
SELECT height, COUNT(*) AS total
FROM students
GROUP BY height
having total > 1
```


### 8

```sql
SELECT *
FROM students
WHERE height >= 170 
AND height <= 190
```


### 9

```sql
SELECT *
FROM students
WHERE height >= 160 
AND height <= 190 
AND height%10 = 0
```


### 10

```sql
INSERT INTO students 
VALUES (NULL, 'Parker', 'Antony', 199, 'M')
```


### 11

```sql
SELECT id,
last_name,
first_name,
CONCAT(Floor(height/100),'m',height%100) as height,
sex
FROM students
```


### 12

```sql
UPDATE students
SET height = 189
WHERE last_name = "Parker"
```


### 13

```sql
DELETE FROM students
WHERE first_name = "Maxine"
```


### 14

```sql
SELECT id,
       last_name,
       first_name,
       height,
       IF(sex = "M", 'Homme', 'Femme') AS sex
FROM students
```


### 15
### On dirait l'exo 6

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