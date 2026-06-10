-- 1.1
CREATE
DATABASE tp DEFAULT CHARACTER SET utf8;

-- 1.2
CREATE TABLE student
(
    id      INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(64) NOT NULL,
    birthAt DATE DEFAULT NULL
);

-- 1.3
ALTER TABLE student
    ADD COLUMN height INT(3) DEFAULT NULL;

-- 1.4
ALTER TABLE student
    ADD COLUMN gender ENUM('H', 'M', 'A') AFTER name;

-- 1.5
ALTER TABLE student
DROP
COLUMN 'name';

-- 1.6
CREATE TABLE course
(
    id             INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title          VARCHAR(100) NOT NULL,
    description    TEXT,
    hours_required INT(3),
    is_active      BOOLEAN DEFAULT TRUE
);