-- 1-1

SELECT first_name, last_name FROM students; -- 60 Lignes

-- 1-2

SELECT * FROM students WHERE (sex = 'M' AND height <= 160) OR (sex = 'F' AND height >= 160); -- 33 lignes

-- 1-3

SELECT MIN(height) FROM students; -- 121

-- 1-4

SELECT AVG(height) FROM students WHERE sex = 'M'; -- 163.5484

-- 1-5

SELECT COUNT(*) AS amount, sex FROM students GROUP BY sex; -- 31 M - 29 F

-- 1-6

SELECT COUNT(*) AS amount, sex FROM students WHERE (sex = 'M' AND height <= 160) OR (sex = 'F' AND height >= 160) GROUP BY sex; -- 13 M - 20 F

-- 1-7

SELECT COUNT(*) AS amount, height FROM students GROUP BY height HAVING COUNT(*) > 1; -- 16 Lignes

-- 1-8

SELECT COUNT(*) AS amount FROM students WHERE height <= 190 AND height >= 170; -- 19

-- 1-9

SELECT COUNT(*) AS amount FROM students WHERE height = 160 OR height = 170 OR height = 180 OR height = 190;
-- 2

-- 1-10
INSERT INTO students VALUES (NULL, "Parker", "Antony", 199, 'M');

-- 1-11

SELECT id, last_name, first_name, CONCAT(ROUND(height/100, 2), "m"), sex FROM students;

-- 1-12

UPDATE students SET height = 189 WHERE last_name = "Parker";
SELECT * FROM students WHERE last_name = "Parker";

-- 1-13

DELETE FROM students WHERE first_name = "Maxine";

-- 1-14

SELECT id, last_name, first_name, height, IF(sex = "M", "Homme", "Femme") FROM students;