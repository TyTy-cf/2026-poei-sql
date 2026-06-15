### 1/ Afficher le nom de famille et le prénom de tous les étudiants

```sql
SELECT last_name, first_name
FROM students;
```

### 2/ Afficher les étudiants M de moins de 160cm ou les F de plus de 160

```sql
SELECT *
FROM students
WHERE (sex = 'M' AND height < 160)
   OR (sex = 'F' AND height > 160);
```

### 3/ Afficher la taille minimum parmi tous les étudiants

```sql
SELECT MIN(height)
FROM students;
```

### 4/ Afficher la moyenne de la taille pour les hommes (M)

```sql
SELECT AVG(height)
FROM students
WHERE sex = 'M';
```

### 5/ Afficher le nombre d'étudiants par sexe

```sql
SELECT 'M' AS sexe, COUNT(*) AS total
FROM students
WHERE sex = 'M';

SELECT 'F' AS sexe, COUNT(*) AS total
FROM students
WHERE sex = 'F';
```

### 6/ Même question que la 5, mais pour les étudiants M de moins de 160cm ou les F de plus de 160

```sql
SELECT 'M' AS sexe, COUNT(*) AS total
FROM students
WHERE sex = 'M'
  AND height < 160;

SELECT 'F' AS sexe, COUNT(*) AS total
FROM students
WHERE sex = 'F'
  AND height > 160;
```

### 7/ Afficher le nombre d'étudiants par taille, et uniquement celles ayant plus d'un étudiant

```sql
SELECT height, COUNT(*) AS total
FROM students
GROUP BY height
HAVING total > 1;
```

### 8/ Afficher les étudiants ayant une taille comprise entre 170 et 190cm

```sql
SELECT *
FROM students
WHERE height >= 170
  AND height <= 190;
```

### 9/ Afficher les étudiants faisant exactement 160, 170, 180 et 190cm

```sql
SELECT *
FROM students
WHERE height = 160
   OR height = 170
   OR height = 180
   OR height = 190;
```

### 10/ Créer un étudiant avec les informations suivantes :

- Last_name : Parker
- First_name : Antony
- Height : 199
- Sex : M

```sql
INSERT INTO students (last_name, first_name, height, sex)
VALUES ('Parker', 'Antony', 199, 'M');
```

### 11/ Afficher tous les étudiants et afficher leur taille au format « 1.26m » au lieu de 126

```sql
SELECT *, CONCAT(height / 100, 'm') AS taille
FROM students;
```

### 12/ Modifier les étudiants dont le « last_name » vaut « Parker » afin qu’ils aient une taille de 189

```sql
UPDATE students
SET height = 189
WHERE last_name = 'Parker';
```

### 13/ Supprimer les étudiants dont le « first_name » vaut « Maxine »

```sql
DELETE
FROM students
WHERE first_name = 'Maxine';
```

### 14/ Afficher les étudiants, mais en précisant que « F » est « Femme » et « M » est « Homme »

```sql
SELECT last_name,
       first_name,
       IF(sex = 'M', 'Homme', 'Femme') AS sexe
FROM students;
```

### 15/ Cumulez l’affichage des étudiants avec la question 2 et la question 5

```sql
SELECT *,
       (SELECT COUNT(*) FROM students
        WHERE sex = 'M' AND height < 160) AS total_hommes_moins_160,
       (SELECT COUNT(*) FROM students
        WHERE sex = 'F' AND height > 160) AS total_femmes_plus_160
FROM students
WHERE (sex = 'M' AND height < 160)
   OR (sex = 'F' AND height > 160);
```