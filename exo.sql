--- 1

SELECT last_name, first_name FROM `students`;

--- 2

SELECT * FROM `students` WHERE height <= 160 AND sex = "M" OR height >= 160 AND sex = "F";

--- 3

SELECT MIN(height) FROM `students`;

--- 4

SELECT AVG(height) FROM `students` WHERE sex = "M";

--- 5

SELECT COUNT(*) FROM `students` WHERE sex = "M";

SELECT COUNT(*) FROM `students` WHERE sex = "F";

--- 6

SELECT COUNT(*) FROM `students` WHERE sex = "M" AND height < 160;

SELECT COUNT(*) FROM `students` WHERE sex = "F" AND height > 160;

--- 8

SELECT COUNT(*) FROM `students` WHERE height >= 170 AND height <= 190;

--- 9

--- 10

INSERT INTO `students` VALUES (NULL, "Parker", "Anthony", 190, "M");
