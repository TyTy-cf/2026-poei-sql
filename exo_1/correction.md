### 1/ Afficher le nom de famille et le prénom de tous les étudiants

```sql
SELECT last_name, first_name
FROM students;
```

### 2/ Afficher les étudiants M de moins de 160cm ou les F de plus de 160

```sql
SELECT *
FROM students
WHERE sex = 'M' AND height < 160
   OR sex = 'F' AND height > 160;
```

### 3/ Afficher la taille minimum parmi tous les étudiants

```sql
SELECT MIN(height) AS "Taille mini"
FROM `students`;
```

### 4/ Afficher la moyenne de la taille pour les hommes (M)

```sql
SELECT AVG(height) AS "Taille moyenne"
FROM `students`
WHERE sex = 'M';
```

### 5/ Afficher le nombre d'étudiants par sexe

```sql
SELECT sex, COUNT(*) AS "Nb M"
FROM `students`
WHERE sex = 'M';
```

```sql
SELECT sex, COUNT(*) AS "Nb F"
FROM `students`
WHERE sex = 'F';
```

- Solution avec `GROUP BY`

```sql
SELECT sex, COUNT(*) AS "Nb"
FROM `students`
GROUP BY sex;
```

### 6/ Même question que la 5, mais pour les étudiants M de moins de 160cm ou les F de plus de 160

```sql
SELECT sex, COUNT(*) AS "Nb M"
FROM `students`
WHERE sex = 'M'
  AND height < 160;
```

```sql
SELECT sex, COUNT(*) AS "Nb F"
FROM `students`
WHERE sex = 'F'
  AND height > 160;
```

- Solution avec `GROUP BY`

```sql
SELECT sex, COUNT(*) AS "Nb"
FROM `students`
WHERE sex = 'M' AND height < 160
   OR sex = 'F' AND height > 160
GROUP BY sex;
```

### 7/ Afficher le nombre d'étudiants par taille, et uniquement celles ayant plus d'un étudiant

```sql
SELECT height, COUNT(*) AS nb_height
FROM students
GROUP BY height
HAVING nb_height > 1;
```

### 8/ Afficher les étudiants ayant une taille comprise entre 170 et 190cm

```sql
SELECT *
FROM `students`
WHERE height >= 170 AND height <= 190;
```

### 9/ Afficher les étudiants faisant exactement 160, 170, 180 et 190cm

```sql
SELECT *
FROM `students`
WHERE height >= 160
  AND height <= 190
  AND height%10 = 0;
```

### 10/ Créer un étudiant avec les informations suivantes :
- Last_name : Parker
- First_name : Antony
- Height : 199
- Sex : M

```sql
INSERT INTO students VALUES
 (NULL, "Parker", "Antony", 199, 'M');
```

### 11/ Afficher tous les étudiants et afficher leur taille au format « 1.26m » au lieu de 126

```sql
SELECT	id,
          last_name,
          first_name,
          CONCAT(ROUND(height/100, 2), 'm') AS height,
          sex

FROM `students`;
```

### 12/ Modifier les étudiants dont le « last_name » vaut « Parker » afin qu’ils aient une taille de 189

```sql
UPDATE students
SET height = 189
WHERE last_name = "Parker";
```

### 13/ Supprimer les étudiants dont le « first_name » vaut « Maxine »

```sql
DELETE FROM students
WHERE first_name = "Maxine";
```

### 14/ Afficher les étudiants, mais en précisant que « F » est « Femme » et « M » est « Homme »

```sql
SELECT	id,
        last_name,
        first_name,
        CONCAT(ROUND(height/100, 2), 'm') AS height,
        IF(sex = 'F', "Femme", "Homme") AS sex

FROM `students`;
```
