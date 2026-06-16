-- 1

SELECT 
    b.label AS brand_label, 
    m.label AS model_label, 
    c.label AS category_label, 
    l.produce_year, 
    l.price, 
    l.description, 
    DATE_FORMAT(l.publish_at, '%d/%m/%Y %H:%i:%s'),
    CONCAT(s.first_name, " ", UPPER(s.last_name)) AS "Nom", 
    s.location
FROM models AS m
JOIN brands AS b ON b.id = m.brand_id
JOIN categories AS c ON c.id = m.category_id
JOIN listings AS l ON m.id = l.model_id
JOIN sellers AS s ON s.id = l.seller_id;

-- 2

SELECT 
    b.label AS brand_label, 
    m.label AS model_label, 
    c.label AS category_label, 
    l.produce_year, 
    l.price, 
    l.description, 
    s.last_name, 
    s.first_name, 
    s.location
FROM models AS m
JOIN brands AS b ON b.id = m.brand_id
JOIN categories AS c ON c.id = m.category_id
JOIN listings AS l ON m.id = l.model_id
JOIN sellers AS s ON s.id = l.seller_id
ORDER BY l.publish_at DESC
LIMIT 20;

-- 3

SELECT 
    b.label AS brand_label, 
    COUNT(l.model_id) AS sell_amount
FROM brands AS b
JOIN models AS m ON m.brand_id = b.id
JOIN listings AS l ON l.model_id = m.id
GROUP BY brand_label;

-- 4 

SELECT 
    b.label AS brand_label, 
    m.label AS model_label, 
    c.label AS category_label, 
    l.produce_year, 
    l.price, 
    l.description, 
    s.last_name, 
    s.first_name, 
    s.location
FROM models AS m
JOIN brands AS b ON b.id = m.brand_id
JOIN categories AS c ON c.id = m.category_id
JOIN listings AS l ON m.id = l.model_id
JOIN sellers AS s ON s.id = l.seller_id
WHERE m.brand_id = 1 
    AND category_label = "Citadine" 
    AND l.mileage < 100000
ORDER BY l.publish_at DESC
LIMIT 20;

-- 5

SELECT 
    b.label AS brand_label, 
    m.label AS model_label, 
    c.label AS category_label, 
    l.produce_year, 
    l.price, 
    l.description, 
    s.last_name, 
    s.first_name, 
    s.location
FROM models AS m
JOIN brands AS b ON b.id = m.brand_id
JOIN categories AS c ON c.id = m.category_id
JOIN listings AS l ON m.id = l.model_id
JOIN sellers AS s ON s.id = l.seller_id
WHERE m.brand_id = 1 
    AND c.label = "Citadine" 
    AND l.mileage < 100000 
    AND (l.price >= 5000 AND l.price <= 9000)
ORDER BY l.publish_at DESC
LIMIT 20;

-- 6

SELECT s.email, l.publish_at
FROM sellers AS s
JOIN listings AS l ON l.seller_id = s.id
WHERE l.publish_at >= "2010-06-16";

-- 7

SELECT AVG(price)
FROM listings
WHERE publish_at >= "2013-06-16";

-- 8

SELECT b.label, SUM(l.price)
FROM listings AS l
JOIN models AS m ON m.id = l.model_id
JOIN brands AS b ON b.id = m.brand_id
GROUP BY b.id DESC;

-- 9

SELECT 
    CONCAT(s.first_name, " ", UPPER(s.last_name)) AS "Nom vendeur", 
    COUNT(*) AS sell
FROM listings AS l
JOIN sellers AS s ON s.id = l.seller_id
GROUP BY l.seller_id
ORDER BY sell DESC;