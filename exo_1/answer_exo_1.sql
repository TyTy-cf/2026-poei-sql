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
having COUNT(height) > 1
ORDER BY height;


#8
#9
#10
#11
#12
#13
#15