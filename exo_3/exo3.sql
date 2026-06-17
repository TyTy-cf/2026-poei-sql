SELECT
    brands.label,
    models.label,
    categories.label,
    listings.produce_year,
    listings.price,
    listings.description,
    listings.publish_at,
    CONCAT(sellers.first_name, " ", sellers.last_name),
    sellers.location
FROM listings

LEFT JOIN sellers ON listings.seller_id = sellers.id
LEFT JOIN models ON listings.model_id = models.id
LEFT JOIN brands ON models.brand_id = brands.id
LEFT JOIN categories ON models.category_id = categories.id;



SELECT
    brands.label,
    models.label,
    categories.label,
    listings.produce_year,
    listings.price,
    listings.description,
    listings.publish_at,
    CONCAT(sellers.first_name, " ", sellers.last_name),
    sellers.location
FROM listings

         LEFT JOIN sellers ON listings.seller_id = sellers.id
         LEFT JOIN models ON listings.model_id = models.id
         LEFT JOIN brands ON models.brand_id = brands.id
         LEFT JOIN categories ON models.category_id = categories.id;

LIMIT 20;



SELECT
    brands.label,
    COUNT(*) AS nbAnnonces
FROM listings
         LEFT JOIN models ON listings.model_id = models.id
         LEFT JOIN brands ON models.brand_id = brands.id
GROUP BY brands.label;


SELECT
    brands.label,
    models.label,
    categories.label,
    listings.produce_year,
    listings.price,
    listings.description,
    listings.publish_at,
    CONCAT(sellers.first_name, " ", sellers.last_name),
    sellers.location
FROM listings

         LEFT JOIN sellers ON listings.seller_id = sellers.id
         LEFT JOIN models ON listings.model_id = models.id
         LEFT JOIN brands ON models.brand_id = brands.id
         LEFT JOIN categories ON models.category_id = categories.id

WHERE brands.label = "Renault" AND
listings.mileage < 100000 AND
categories.label = "Citadine"
ORDER BY listings.publish_at DESC
LIMIT 20;



SELECT
    brands.label,
    models.label,
    categories.label,
    listings.produce_year,
    listings.price,
    listings.description,
    listings.publish_at,
    CONCAT(sellers.first_name, " ", sellers.last_name),
    sellers.location
FROM listings

         LEFT JOIN sellers ON listings.seller_id = sellers.id
         LEFT JOIN models ON listings.model_id = models.id
         LEFT JOIN brands ON models.brand_id = brands.id
         LEFT JOIN categories ON models.category_id = categories.id

WHERE brands.label = "Renault" AND
    listings.mileage < 100000 AND
    categories.label = "Citadine" AND
    listings.price >= 5000 AND
    listings.price <= 9000

    LIMIT 20;


SELECT
    sellers.email
FROM listings
         LEFT JOIN sellers ON listings.seller_id = sellers.id
WHERE listings.publish_at >= "2018-06-16";


SELECT AVG(price)
FROM listings
WHERE publish_at >= "2013-06-16";



SELECT brands.label,
       SUM(listings.price)

    FROM listings

             LEFT JOIN models ON listings.model_id = models.id
             LEFT JOIN brands ON models.brand_id = brands.id

GROUP BY brands.label;



SELECT
    COUNT(l.id) AS NbAnnonces,
    CONCAT(UPPER(sellers.last_name), " ", sellers.first_name) AS NomVendeur

FROM listings
LEFT JOIN sellers ON listings.seller_id = sellers.id

GROUP BY NomVendeur;