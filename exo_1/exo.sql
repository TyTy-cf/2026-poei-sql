-- 1

SELECT first_name, last_name 
FROM students;

-- 2

SELECT * 
FROM students 
WHERE (sex = "M" AND height < 160) OR (sex = "F" AND height > 160);

-- 3

SELECT MIN(height) AS "Taille Minimale"
FROM students;

-- 4

SELECT AVG(height) AS "Moyenne Taille Hommes"
FROM students
WHERE sex = "M";

-- 5

SELECT COUNT(sex) AS "Hommes"
FROM students
WHERE sex = "M";

SELECT COUNT(sex) AS "Femmes"
FROM students
WHERE sex = "F";

-- 6

SELECT COUNT(sex) AS "Hommes"
FROM students
WHERE sex = "M" AND height < 160

SELECT COUNT(sex) AS "Femmes"
FROM students
WHERE sex = "F" AND height > 160;

-- 7

SELECT height, COUNT(*)
FROM students
GROUP BY height
HAVING COUNT(*) > 1;

-- 8

SELECT *
FROM students
WHERE (height >= 170 AND height <= 190);

-- 9

SELECT *
FROM students
WHERE (height = 160 OR height = 170 OR height = 180 OR height = 190);

-- 10

INSERT INTO students (last_name, first_name, height, sex)
VALUES ("Parker", "Antony", 199, "M");

-- 11

SELECT *, CONCAT(ROUND((height/100), 2), "m") AS height_real
FROM students;