### 1/  

select first_name,last_name from students;

### 2/ 

SELECT *
FROM students
WHERE (sex ='M'  AND height < 160) OR (sex ='F' AND height > 160);


### 3/

SELECT MIN(height)
FROM students;


### 4/

SELECT AVG(height)
FROM students
    WHERE sex = 'M';

### 5/    

SELECT COUNT(id)
FROM students
WHERE sex = 'M';


SELECT COUNT(id)
FROM students
WHERE sex = 'F';


### 6/ 

SELECT COUNT(id)
FROM students
WHERE (sex = 'M' AND height < 160 ) OR (sex = 'F' AND height > 160);

### 7/ 


### 8/ 

SELECT *
FROM students
 WHERE (height <=190) AND (height >=170);


 ### 9/ 

 SELECT *
FROM students
WHERE height IN (160,170,180,190);

### 10/ 

INSERT INTO students (id, last_name,first_name,height,sex) VALUES (NULL,'Parker','Antony',199,'M');

### 11/ 

SELECT COUNT(id,' ',last_name,' ',first_name,' ',height/100,'.',height%100,' m')
FROM students;


### 12/ 

UPDATE students SET height = 189 WHERE last_name = 'Parker';

### 13/ 

DELETE FROM students WHERE first_name = 'Maxime';

### 14/ 

SELECT CONCAT(id,last_name,first_name,height,sex,'emme') FROM `students` WHERE sex = 'F';

SELECT CONCAT(id,last_name,first_name,height,sex,'omme') FROM `students` WHERE sex = 'M';

### 15/ 


