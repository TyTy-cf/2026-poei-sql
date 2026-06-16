--2)----------
SELECT m.label,
       b.label,
       c.label,
       l.produce_year,
       l.price,
       l.publish_at,
       CONCAT('Nom vendeur: ', UPPER(s.first_name), ' ', s.last_name)

FROM listings as l

         JOIN sellers as s
              ON s.id = l.seller_id
         JOIN models as m
              ON m.id = l.model_id
         JOIN brands as b
              ON b.id = m.brand_id
         JOIN categories as c
              ON c.id = m.category_id
ORDER BY l.publish_at DESC LIMIT 20;

-- 3)------------------------
SELECT COUNT(*), b.label
FROM listings as l

         JOIN sellers as s
              ON s.id = l.seller_id
         JOIN models as m
              ON m.id = l.model_id
         JOIN brands as b
              ON b.id = m.brand_id
         JOIN categories as c
              ON c.id = m.category_id
GROUP BY b.label;

-- 4) ----------------------------
SELECT b.label,
       m.label,
       c.label,
       l.mileage,
       l.publish_at

FROM listings as l

         JOIN sellers as s
              ON s.id = l.seller_id
         JOIN models as m
              ON m.id = l.model_id
         JOIN brands as b
              ON b.id = m.brand_id
         JOIN categories as c
              ON c.id = m.category_id
WHERE b.label = 'Renault'
  AND c.label = 'Citadine'
  AND l.mileage < 100000
ORDER BY l.publish_at DESC LIMIT 20;

-- 5) -----------------------
SELECT b.label,
       m.label,
       c.label,
       l.mileage,
       l.publish_at,
       l.price


FROM listings as l

         JOIN sellers as s
              ON s.id = l.seller_id
         JOIN models as m
              ON m.id = l.model_id
         JOIN brands as b
              ON b.id = m.brand_id
         JOIN categories as c
              ON c.id = m.category_id
WHERE b.label = 'Renault'
  AND c.label = 'Citadine'
  AND l.mileage < 100000
  AND l.price BETWEEN 5000 AND 9000

ORDER BY l.publish_at DESC LIMIT 20;


-- 6)--------------------------------
SELECT s.email,
       l.publish_at


FROM listings as l

         JOIN sellers as s
              ON s.id = l.seller_id
         JOIN models as m
              ON m.id = l.model_id
         JOIN brands as b
              ON b.id = m.brand_id
         JOIN categories as c
              ON c.id = m.category_id


WHERE l.publish_at >= DATE_SUB(NOW(), INTERVAL 10 YEAR)


-- 7) ------------------------------------
SELECT FORMAT(AVG(l.price), 2) AS Moy_vente

FROM listings as l

WHERE l.publish_at >= DATE_SUB(NOW(), INTERVAL 10 YEAR)

-- 8) ------------------------
SELECT b.label,
       FORMAT(SUM(l.price), 2) AS CA_Marque
FROM listings as l
         JOIN models as m
              ON m.id = l.model_id
         JOIN brands as b
              ON m.brand_id = b.id

GROUP BY b.label


-- 9)------------------
SELECT COUNT(*),
       CONCAT('Nom vendeur: ', UPPER(s.first_name), ' ', s.last_name)

FROM listings as l

         JOIN sellers as s
              ON s.id = l.seller_id
GROUP BY s.id



