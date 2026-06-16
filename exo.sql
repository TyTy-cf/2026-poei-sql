---- Exo 1

--- 1

SELECT last_name, first_name
FROM `students`;

--- 2

SELECT *
FROM `students`
WHERE height <= 160 AND sex = "M"
   OR height >= 160 AND sex = "F";

--- 3

SELECT MIN(height)
FROM `students`;

--- 4

SELECT AVG(height)
FROM `students`
WHERE sex = "M";

--- 5

SELECT COUNT(*)
FROM `students`
WHERE sex = "M";

SELECT COUNT(*)
FROM `students`
WHERE sex = "F";

--- 6

SELECT COUNT(*)
FROM `students`
WHERE sex = "M"
  AND height < 160;

SELECT COUNT(*)
FROM `students`
WHERE sex = "F"
  AND height > 160;

--- 8

SELECT COUNT(*)
FROM `students`
WHERE height >= 170
  AND height <= 190;

--- 9

--- 10

INSERT INTO `students`
VALUES (NULL, "Parker", "Anthony", 190, "M");

--- 11

--- 12

UPDATE `students`
SET height = 189
WHERE last_name = "PARKER";

--- 13

DELETE
FROM `students`
WHERE first_name = "Maxine";

--- 14

SELECT *, IF(sex = "M", 'Homme', 'Femme')
FROM `students`;



--- EXO 2

--- 1

SELECT *
FROM `pokemon`
WHERE is_default = 0;

--- 2

SELECT AVG(hp), AVG(atk), AVG(def), AVG(spa), AVG(spd), AVG(spe)
FROM pokemon;

--- 3

SELECT *
FROM `pokemon`
ORDER BY weight DESC LIMIT 1;

--- 4

SELECT *
FROM `pokemon`
ORDER BY height ASC LIMIT 1;

--- 5

SELECT *
FROM `pokemon`
ORDER BY spe ASC LIMIT 1;

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

SELECT name
FROM pokemon
WHERE LENGTH(name) <= 3;

--- 12

SELECT name, hp + atk + def + spa + spd + spe AS total
FROM pokemon
ORDER BY `total` DESC

--- 13

SELECT name, base_experience AS evo
FROM pokemon
ORDER BY `evo` ASC;

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