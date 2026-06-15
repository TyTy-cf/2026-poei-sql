#1
SELECT last_name, first_name FROM students

#2
SELECT * FROM students WHERE sex = "M" AND height < 160 OR sex = "F" AND height > 160;

#3

select MIN(height) FROM students;

#4
select AVG(height) FROM students WHERE sex = "M";

#5
SELECT COUNT(*) FROM students WHERE sex = "M" ;
SELECT COUNT(*) FROM students WHERE sex = "F" ;


-- Afficher le nombre d'étudiants par sexe

SELECT sex, COUNT(*) AS nbr_etudiants
FROM students
GROUP BY sex;



#6
SELECT sex, COUNT(*) AS nbr_etudiants
FROM students
WHERE sex = "M" AND height < 160 OR sex = "F" AND height > 160
GROUP BY sex;

SELECT COUNT(*) FROM students WHERE sex = "M" AND height < 160;
SELECT COUNT(*) FROM students WHERE sex = "F" AND height > 160;

#7
SELECT height, COUNT(height) AS nbr_etudiants
FROM students
GROUP BY height
HAVING COUNT(height) > 1
ORDER BY height;

#8
SELECT *
FROM students
WHERE height >= 170 AND height <= 190;

#9
SELECT *
FROM students
WHERE height = 170 OR height = 190 OR height = 180;

#10
INSERT INTO students (last_name, first_name, height, sex) VALUES ("Parker", "Antony", 199, "M");

#11
SELECT first_name, last_name, sex, CONCAT(LEFT(height, 1), ".", RIGHT(height, 2), "m") as student_height FROM students;

#12
UPDATE students SET height = 189 WHERE last_name = "Parker";

#13
DELETE FROM students WHERE first_name = "Maxine";

#14
SELECT 
    first_name, 
    last_name, 
    height, 
    IF( sex = "M", "Homme", "Femme") AS "Sex"
FROM students;

#15

-- cumuluez 2 et 5

SELECT sex, COUNT(*) AS nbr_etudiants
FROM students
WHERE sex = "M" AND height < 160 OR sex = "F" AND height > 160
GROUP BY sex;