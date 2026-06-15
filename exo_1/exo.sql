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
HAVING COUNT(*) > 2;