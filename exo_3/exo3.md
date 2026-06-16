### 1

```sql
SELECT 
	b.label,
    m.label,
    c.label,
    l.produce_year,
    l.price,
    l.description,
    l.publish_at,
    CONCAT(UPPER(s.last_name), ' ',s.first_name) AS "Nom Vendeur",
    s.location

FROM `listings` AS l
JOIN models AS m ON m.id = l.model_id
JOIN brands AS b ON b.id = m.brand_id
JOIN categories AS c ON c.id = m.category_id
JOIN sellers AS s ON s.id = l.seller_id
```


### 2

```sql
SELECT 
	b.label,
    m.label,
    c.label,
    l.produce_year,
    l.price,
    l.description,
    l.publish_at,
    CONCAT(UPPER(s.last_name), ' ',s.first_name) AS "Nom Vendeur",
    s.location

FROM `listings` AS l
JOIN models AS m ON m.id = l.model_id
JOIN brands AS b ON b.id = m.brand_id
JOIN categories AS c ON c.id = m.category_id
JOIN sellers AS s ON s.id = l.seller_id

ORDER BY l.publish_at DESC
LIMIT 20
```


### 3

```sql
SELECT COUNT(b.label),
b.label
FROM `listings` AS l
JOIN brands AS b ON b.id = l.model_id
GROUP BY b.label
```


### 4

```sql
SELECT
    b.label,
    m.label,
    c.label,
    l.produce_year,
    l.price,
    l.description,
    l.publish_at,
    CONCAT(UPPER(s.last_name), ' ',s.first_name) AS "Nom Vendeur",
    s.location

FROM `listings` AS l
         JOIN models AS m ON m.id = l.model_id
         JOIN brands AS b ON b.id = m.brand_id
         JOIN categories AS c ON c.id = m.category_id
         JOIN sellers AS s ON s.id = l.seller_id

WHERE c.label = 'Citadine'
  AND mileage < 100000
ORDER BY l.publish_at DESC
    LIMIT 20
```


### 5

```sql
SELECT 
	b.label,
    m.label,
    c.label,
    l.produce_year,
    l.price,
    l.description,
    l.publish_at,
    CONCAT(UPPER(s.last_name), ' ',s.first_name) AS "Nom Vendeur",
    s.location

FROM `listings` AS l
JOIN models AS m ON m.id = l.model_id
JOIN brands AS b ON b.id = m.brand_id
JOIN categories AS c ON c.id = m.category_id
JOIN sellers AS s ON s.id = l.seller_id

WHERE c.label = 'Citadine'
	AND mileage < 100000
	AND price > 5000
    AND price < 9000
ORDER BY l.publish_at DESC
LIMIT 20
```


### 6

```sql

```


### 7

```sql

```


### 8

```sql

```


### 9

```sql

```