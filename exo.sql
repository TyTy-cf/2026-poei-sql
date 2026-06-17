// Requêtes SQL :

// TP 1:

 // Création de la DB :

CREATE DATABASE tp DEFAULT CHARACTER SET utf8;

// Tables Student :

CREATE TABLE student (
                         id INT(6) NOT NULL AUTO_INCREMENT,
                         name VARCHAR(64) NOT NULL,
                         birthAt DATETIME NOT NULL,
                         PRIMARY KEY(id)
)

ALTER TABLE student
    ADD COLUMN height INT(3) DEFAULT NULL;

ALTER TABLE student
    ADD COLUMN gender ENUM('H', 'F', 'A') AFTER name;

ALTER TABLE student
DROP COLUMN name

// Table Matières

CREATE TABLE cours (
                       id INT NOT NULL AUTO_INCREMENT,
                       matieres VARCHAR(64) NOT NULL,
                       onSite BOOLEAN NOT NULL,
                       teacherName VARCHAR(64) NOT NULL,
                       nbPlaces INT NOT NULL,
                       duration INT(40) NOT NULL,
                       exam BOOLEAN DEFAULT NULL,
                       notationType VARCHAR(64) NOT NULL,
                       hasBreak BOOLEAN DEFAULT NULL,
                       PRIMARY KEY(id)
)

------------------------------------------------------------------------------------------------------------


    // TP 2 :

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

--- 11

--- 12

UPDATE `students` SET height = 189 WHERE last_name = "PARKER";

--- 13

DELETE FROM `students` WHERE first_name = "Maxine";

--- 14

SELECT *, IF(sex = "M", 'Homme', 'Femme') FROM `students`;



--- EXO 2

--- 1

SELECT * FROM `pokemon` WHERE is_default = 0;

--- 2

SELECT AVG(hp), AVG(atk), AVG(def), AVG(spa), AVG(spd), AVG(spe)
FROM pokemon;

--- 3

SELECT * FROM `pokemon` ORDER BY weight DESC LIMIT 1;

--- 4

SELECT * FROM `pokemon` ORDER BY height ASC LIMIT 1;

--- 5

SELECT * FROM `pokemon` ORDER BY spe ASC LIMIT 1;

--- 6

SELECT *
FROM pokemon
WHERE atk > 150
ORDER BY atk DESC;

--- 7

SELECT name, hp + atk + def + spa + spd + spe AS total-stats
FROM pokemon;

--- 8

SELECT slug, name_api
FROM pokemon
WHERE slug = name_api;

--- 9

SELECT *
FROM `pokemon`
WHERE name LIKE '%mew%';

--- 11

SELECT name FROM pokemon WHERE LENGTH(name) <= 3;

--- 12

SELECT name, hp + atk + def + spa + spd + spe AS total FROM pokemon ORDER BY `total` DESC

--- 13

SELECT name, base_experience AS evo FROM pokemon ORDER BY `evo` ASC;

--- 14

---- Exo 3 :

---1

SELECT brands.label,
       models.label,
       categories.label,
       listings.produce_year,
       listings.price,
       listings.description,
       listings.publish_at,
       CONCAT(UPPER(sellers.first_name), " ", UPPER(sellers.last_name)),
       sellers.location
FROM listings
         LEFT JOIN sellers ON listings.seller_id = sellers.id
         LEFT JOIN models ON listings.model_id = models.id
         LEFT JOIN brands ON models.brand_id = brands.id
         LEFT JOIN categories ON models.category_id = categories.id;

---2

SELECT brands.label,
       models.label,
       categories.label,
       listings.produce_year,
       listings.price,
       listings.description,
       listings.publish_at,
       CONCAT(UPPER(sellers.first_name), " ", UPPER(sellers.last_name)),
       sellers.location
FROM listings
         LEFT JOIN sellers ON listings.seller_id = sellers.id
         LEFT JOIN models ON listings.model_id = models.id
         LEFT JOIN brands ON models.brand_id = brands.id
         LEFT JOIN categories ON models.category_id = categories.id

ORDER BY listings.publish_at DESC

    LIMIT 20;


---3

SELECT  brands.label,
        COUNT(*) AS "NB Annonces"
FROM listings

         LEFT JOIN models ON listings.model_id = models.id
         LEFT JOIN brands ON models.brand_id = brands.id
GROUP BY brands.label;

---4

SELECT brands.label,
       models.label,
       categories.label,
       listings.produce_year,
       listings.price,
       listings.description,
       listings.publish_at,
       listings.mileage,
       CONCAT(UPPER(sellers.first_name), " ", UPPER(sellers.last_name)),
       sellers.location
FROM listings
         LEFT JOIN sellers ON listings.seller_id = sellers.id
         LEFT JOIN models ON listings.model_id = models.id
         LEFT JOIN brands ON models.brand_id = brands.id
         LEFT JOIN categories ON models.category_id = categories.id

WHERE brands.label = "Renault" AND categories.label = "Citadine" AND listings.mileage < 100000

    LIMIT 20;

---5


SELECT brands.label,
       models.label,
       categories.label,
       listings.produce_year,
       listings.price,
       listings.description,
       listings.publish_at,
       listings.mileage,
       CONCAT(UPPER(sellers.first_name), " ", UPPER(sellers.last_name)) AS Contact,
       sellers.location
FROM listings
         LEFT JOIN sellers ON listings.seller_id = sellers.id
         LEFT JOIN models ON listings.model_id = models.id
         LEFT JOIN brands ON models.brand_id = brands.id
         LEFT JOIN categories ON models.category_id = categories.id

WHERE brands.label = "Renault" AND categories.label = "Citadine" AND listings.mileage < 100000 AND listings.price >= 5000 AND listings.price <= 9000

    LIMIT 20;


--- 6

SELECT sellers.email,
       listings.publish_at


FROM listings

         LEFT JOIN sellers ON listings.seller_id = sellers.id

WHERE listings.publish_at >= "2018-06-16";

---7

SELECT ROUND(AVG(listings.price))

FROM listings

WHERE YEAR(listings.publish_at) >= YEAR(NOW()) - 9;

---8

SELECT brands.label AS "Brands",
       ROUND(SUM(listings.price)) AS CA

FROM listings

         LEFT JOIN models ON listings.model_id = models.id
         LEFT JOIN brands ON models.brand_id = brands.id
GROUP BY brands.label;

---9


SELECT
    CONCAT(UPPER(sellers.first_name), " ", UPPER(sellers.last_name)) AS Nom,
    COUNT(*)


FROM listings

         LEFT JOIN sellers ON listings.seller_id = sellers.id

GROUP BY Nom;

---- Exo 4

---1

SELECT game.name         AS NAME,
       game.published_at AS PUBLICATION

FROM game

ORDER BY PUBLICATION DESC;

---2

SELECT game.name  AS NAME,
       game.price AS PRICE

FROM game

ORDER BY PRICE DESC;

---3

SELECT game.name         AS NAME,
       game.published_at AS PUBLICATION,
       genre.name        AS GENRE

FROM game

         JOIN game_genre ON game.id = game_genre.game_id
         JOIN genre ON genre.id = game_genre.genre_id

WHERE genre.name = "FPS"


ORDER BY PUBLICATION DESC;

---4

SELECT a.nickname,
       SUM(l.game_time) AS total_play_time
FROM account a
         JOIN library l ON l.account_id = a.id
GROUP BY a.id, a.nickname;

---5

SELECT a.nickname,
       SUM(CASE WHEN l.installed = 1 THEN 1 ELSE 0 END) AS installed,
       COUNT(l.id)                                      AS total,
       CONCAT(
               SUM(CASE WHEN l.installed = 1 THEN 1 ELSE 0 END),
               '/',
               COUNT(l.id)
       )                                                AS ratio
FROM account a
         LEFT JOIN library l ON l.account_id = a.id
GROUP BY a.id, a.nickname;

---6

SELECT a.nickname,
       SUM(g.price) AS library_value
FROM account a
         LEFT JOIN library l ON l.account_id = a.id
         LEFT JOIN game g ON g.id = l.game_id
GROUP BY a.id, a.nickname;

---7

SELECT nickname, COUNT(*) AS nb
FROM account
GROUP BY nickname
HAVING COUNT(*) > 1;

---8

SELECT g.name,
       COUNT(l.id) AS nb_purchases
FROM game g
         LEFT JOIN library l ON l.game_id = g.id
GROUP BY g.id, g.name;

---9

SELECT g.name,
       COUNT(l.id) AS nb_purchases,
       SUM(g.price) AS revenu,
       p.name

FROM game g
         LEFT JOIN library l ON l.game_id = g.id
         LEFT JOIN publisher p ON p.id = g.publisher_id
GROUP BY p.name;

---10

SELECT COUNT(l.id) AS nb_purchases,
       gr.name

FROM game g
         LEFT JOIN library l ON l.game_id = g.id
         LEFT JOIN game_genre gg ON g.id = gg.game_id
         LEFT JOIN genre gr ON gr.id = gg.genre_id
GROUP BY gr.id, gr.name;

---11

SELECT g.name,
       COUNT(*) AS nb_purchases
FROM game g
         LEFT JOIN library l ON l.game_id = g.id
GROUP BY g.id, g.name
ORDER BY `nb_purchases` DESC LIMIT 3

---12

SELECT g.name,
       SUM(l.game_time) AS GameTime
FROM game g
         LEFT JOIN library l ON l.game_id = g.id
GROUP BY g.id, g.name
ORDER BY GameTime DESC LIMIT 3;

---13
SELECT CONCAT(g.name, " ", "-",
           YEAR(g.published_at)) AS GAMEYEAR

FROM game g

GROUP BY g.name, g.published_at;

---14

SELECT g.name,
    YEAR(g.published_at) AS GAMEYEAR

FROM game g

GROUP BY g.name, g.published_at

ORDER BY GAMEYEAR ASC LIMIT 1;

---- 15
SELECT g.name,
       ROUND(AVG(c.rank)) AS "Average rank"

FROM game g

         JOIN comment c ON c.game_id = g.id

GROUP BY g.name;

--- 16

SELECT g.name,
       COUNT(c.down_votes) AS Negative

FROM game g

         JOIN comment c ON c.game_id = g.id

GROUP BY g.name

ORDER BY Negative DESC LIMIT 1;

---17

SELECT g.name,
       ROUND(AVG(c.rank)) AS `Average rank`

FROM game g

         JOIN comment c ON c.game_id = g.id

GROUP BY g.name

HAVING ROUND(AVG(c.rank)) > (
    SELECT AVG(c.rank)
    FROM comment c
);

---18

SELECT a.name,
       a.nickname,
       COUNT(l.id),
       IF(COUNT(l.id) IS NULL, 0, COUNT(l.id))
FROM account a

         JOIN library l ON l.account_id = a.id
         JOIN game g ON l.game_id = g.id


GROUP BY a.name, a.nickname

HAVING (
SELECT COUNT(*) AS SELL
FROM library lib
WHERE SELL = 0
);


---19


SELECT COUNT(l.id) AS nb_purchases,
       gr.name

FROM game g
         LEFT JOIN library l ON l.game_id = g.id
         LEFT JOIN game_genre gg ON g.id = gg.game_id
         LEFT JOIN genre gr ON gr.id = gg.genre_id
GROUP BY gr.id, gr.name
ORDER BY nb_purchases DESC LIMIT 1;


