-- 3-1

SELECT b.label AS brand, m.label AS model, c.label AS category, l.produce_year, l.price, l.description, l.publish_at, CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom Vendeur", s.location
FROM listings AS l
JOIN models AS m ON l.model_id = m.id
JOIN brands AS b ON m.brand_id = b.id
JOIN categories AS c ON m.category_id = c.id
JOIN sellers AS s ON l.seller_id = s.id;

-- 3-2

SELECT b.label AS brand, m.label AS model, c.label AS category, l.produce_year, l.price, l.description, l.publish_at, CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom Vendeur", s.location
FROM listings AS l
         JOIN models AS m ON l.model_id = m.id
         JOIN brands AS b ON m.brand_id = b.id
         JOIN categories AS c ON m.category_id = c.id
         JOIN sellers AS s ON l.seller_id = s.id
ORDER BY l.publish_at DESC LIMIT 20;

-- 3-3

SELECT b.label, COUNT(b.id) AS nb_listings
FROM listings AS l
         JOIN models AS m ON l.model_id = m.id
         JOIN brands AS b ON m.brand_id = b.id
GROUP BY b.label;

# Audi,428
# Ford,88
# Peugeot,183
# Renault,214
# Tesla,83

-- 3-4

SELECT b.label AS brand, m.label AS model, c.label AS category, l.produce_year, l.price, l.description, l.publish_at, CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom Vendeur", s.location
FROM listings AS l
         JOIN models AS m ON l.model_id = m.id
         JOIN brands AS b ON m.brand_id = b.id
         JOIN categories AS c ON m.category_id = c.id
         JOIN sellers AS s ON l.seller_id = s.id
WHERE b.label = "Renault" AND c.label = "Citadine" AND l.mileage <= 100000
ORDER BY l.publish_at DESC LIMIT 20;

-- 3-5

SELECT b.label AS brand, m.label AS model, c.label AS category, l.produce_year, l.price, l.description, l.publish_at, CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom Vendeur", s.location
FROM listings AS l
         JOIN models AS m ON l.model_id = m.id
         JOIN brands AS b ON m.brand_id = b.id
         JOIN categories AS c ON m.category_id = c.id
         JOIN sellers AS s ON l.seller_id = s.id
WHERE b.label = "Renault" AND c.label = "Citadine" AND l.mileage <= 100000 AND l.price BETWEEN 5000 AND 9000;

-- 3-6 Obligé de faire il y a 8 ans, ya pas d'annonces de moins de 1 an

SELECT s.email, CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom Vendeur"
FROM listings AS l
         JOIN models AS m ON l.model_id = m.id
         JOIN sellers AS s ON l.seller_id = s.id
WHERE l.publish_at >= DATE_SUB(NOW(), INTERVAL 8 YEAR);

-- 3-7 j'ai fait sur les 12 dernières années

SELECT AVG(l.price)
FROM listings AS l
WHERE l.publish_at >= DATE_SUB(NOW(), INTERVAL 12 YEAR);

-- 3-8

SELECT b.label, SUM(l.price) AS chiffre_affaire
FROM listings AS l
         JOIN models AS m ON l.model_id = m.id
         JOIN brands AS b ON m.brand_id = b.id
GROUP BY b.label;

-- 3-9

SELECT CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom Vendeur", SUM(s.id) AS nb_annonces
FROM listings AS l
         JOIN models AS m ON l.model_id = m.id
         JOIN sellers AS s ON l.seller_id = s.id
GROUP BY s.id;