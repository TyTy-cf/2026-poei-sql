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
WHERE (sex = 'M');

-- ------------------------------
SELECT COUNT(*) AS men
FROM students
WHERE (sex = 'F');

-- 6) ------------
SELECT COUNT(*) AS men_less_160
FROM students
WHERE (
          sex = 'M'
              AND
          height < 160
          );
--7) --------------
SELECT height, COUNT(*) AS total_students
FROM students
GROUP BY height
HAVING COUNT(*) > 1;

--8) ------------
SELECT *
FROM students
WHERE (
          height > 160
              AND
          height < 180)


--9) ----------------
SELECT *
FROM students
WHERE height IN
      (160, 170, 180, 190);

-- 10) -------------
INSERT INTO students (last_name, first_name, height, sex)
VALUES ('Parker', 'Anthony', 199, 'M');


---11) ---------
SELECT *,
       CONCAT(FORMAT(height/100,2),'m')
FROM students;
-- 12) -----------
UPDATE students
SET height = 189
WHERE last_name = 'Parker';

-- 13) ---------------
DELETE
FROM students
WHERE first_name = 'maxine';

--



