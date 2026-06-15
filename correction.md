
## 1.1

```sql
CREATE DATABASE tp
   DEFULT CHARACTER SET utf8;
```

## 1.2

```sql
CREATE TABLE student (
    id INT(6) NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    birthAt DATE DEFAULT NULL,
    PRIMARY KEY(id)
);
```

## 1.3

```sql
ALTER TABLE student
    ADD COLUMN height INT(3) DEFAULT NULL;
```

## 1.4

```sql
ALTER TABLE student
    ADD COLUMN gender ENUM('H', 'F', 'A') DEFAULT NULL AFTER `name`;
```

## 1.5

```sql
ALTER TABLE student
    DROP COLUMN `name`;
```

## 1.6

```sql
CREATE TABLE course (
     id INT(6) NOT NULL AUTO_INCREMENT,
     label VARCHAR(64) NOT NULL,
     duration INT(4) DEFAULT NULL,
     createdAt DATETIME NOT NULL,
     description TEXT NOT NULL,
     is_active TINYINT DEFAULT 1,
     PRIMARY KEY(id)
);
```



