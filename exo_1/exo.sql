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


