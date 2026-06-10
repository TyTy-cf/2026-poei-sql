ALTER TABLE student
    ADD COLUMN height INT(3) DEFAULT NULL



ALTER TABLE student
    ADD COLUMN gender ENUM('H','M','A')

ALTER TABLE student
DROP
COLUMN name;


CREATE TABLE course
(
    id INT(6) AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(id)
    name    VARCHAR(20) NOT NULL,
    hours   INT(1000) NOT NULL,
    teacher VARCHAR(50) NOT NULL,


)