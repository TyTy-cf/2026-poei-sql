SELECT last_name, first_name FROM students;


SELECT * FROM `students`
WHERE sex = "M" AND height < 160 OR sex = "F" AND height > 160;


SELECT MIN(height) FROM students;


SELECT AVG(height) FROM `students` WHERE sex = "M";


SELECT COUNT(*) FROM students
WHERE sex = "M";
SELECT COUNT(*) FROM students
WHERE sex = "F";


SELECT COUNT(*) FROM students
WHERE sex = "M" AND height < 160;
SELECT COUNT(*) FROM students
WHERE sex = "F" AND height > 160;


HAVING UNE PROCHAINE FOIS;


SELECT * FROM `students`
WHERE height >= 170 AND height <= 190;


SELECT * FROM `students`
WHERE height = 160
   OR height = 170
   OR height = 180
   OR height = 190;


INSERT INTO students (id, last_name, first_name, height, sex)
VALUES (NULL, "Parker", "Antony", 199, "M");


SELECT CONCAT (FLOOR(height/100), ".", height%100, "m") FROM students;