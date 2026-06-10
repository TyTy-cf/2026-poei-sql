-- 1.1

CREATE DATABASE tp
DEFAULT CHARACTER SET utf8;

-- 1.2

CREATE TABLE student (
    id INT(6) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    birthAt DATE NULL
)

-- 1.3

ALTER TABLE student
ADD COLUMN height INT(3) NULL;

-- 1.4

ALTER TABLE student
ADD COLUMN gender ENUM('H', 'F', 'NB') AFTER `name`;

-- 1.5

ALTER TABLE student
DROP COLUMN name;

-- 1.6

CREATE TABLE course (
    id INT(2) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(128) NOT NULL,
    chapters INT(2) NOT NULL,
    hours_length INT(4) NOT NULL
)