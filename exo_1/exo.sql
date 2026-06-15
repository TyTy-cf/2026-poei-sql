-- 1

SELECT first_name, last_name 
FROM students;

-- 2

SELECT * 
FROM students 
WHERE (sex = "M" AND height < 160) OR (sex = "F" AND height > 160);

-- 3

SELECT MIN(height) AS shorter
FROM students;

-- 4

SELECT AVG(height) AS avg_man_height
FROM students
WHERE sex = "M";

-- 5

SELECT sex AS sex, COUNT(sex) AS count
FROM students
GROUP BY sex;

-- 6

SELECT sex AS sex, COUNT(sex) AS count
FROM students
WHERE (sex = "M" AND height < 160) OR (sex = "F" AND height > 160)
GROUP BY sex;

-- 7

SELECT height, COUNT(*) AS total_students_by_height
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

-- 12

UPDATE students
SET height = 189
WHERE last_name = "Parker";

-- 13

DELETE FROM students
WHERE first_name = "Maxine";

-- 14

SELECT *,
IF (
    sex = "M",
    "Homme",
    "Femme"
) AS long_sex
FROM students;

-- 15

SELECT sex AS sex, COUNT(sex) AS count
FROM students
WHERE (sex = "M" AND height < 160) OR (sex = "F" AND height > 160)
GROUP BY sex;