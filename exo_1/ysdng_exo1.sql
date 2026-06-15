SELECT *
FROM students;


-- 2) ------
SELECT *
FROM `students`
WHERE (
    height < 160
        AND
    sex = 'M'
    )
   OR (height > 160
    AND
       sex = 'F');


-- 3) --------
SELECT MIN(height) AS min_height
FROM students;


-- 4) ------
SELECT AVG(height) AS height_Moy
FROM students
WHERE (sex = 'M');


-- 5) ----
SELECT COUNT(*) AS men
FROM students
WHERE(sex = 'M');

-- ------------------------------
SELECT COUNT(*) AS men
FROM students
WHERE(sex = 'F');

-- 6) ------------
SELECT COUNT(*) AS men_less_160
FROM students
WHERE(
    sex = 'M'
        AND
    height < 160
    );
--7) --------------
SELECT height, COUNT(*) AS total_students
FROM students
GROUP BY height
HAVING COUNT(*) > 1;

