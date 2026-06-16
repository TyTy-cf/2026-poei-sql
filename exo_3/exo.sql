-- 1

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
    m.label AS model_label, 
    COUNT(l.model_id) AS sell_amount
FROM models AS m
JOIN listings AS l ON l.model_id = m.id
GROUP BY model_label;

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
WHERE l.publish_at >= "2018-06-16";