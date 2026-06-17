### 1/ Afficher Une liste des ventes
On affichera que les informations suivantes :
- Le label de la marque (brands)
- Le label du modèle (models)
- La label de la catégorie (categories)
- L'année de production du véhicule
- Le prix du véhicule
- La description du produit
- La date de publication de la vente au format JJ/MM/AAAA - HH:mm:ss
- Le nom en majuscule et le prénom du vendeur sous le label "Nom vendeur"
- L'adresse du vendeur

```sql
SELECT
	b.label AS brand_label,
	m.label AS model_label,
	c.label AS category_label,
    l.mileage,
    l.price,
    l.description,
    DATE_FORMAT(l.publish_at, "%d/%m/%Y - %H:%i:%s") AS publish_at,
    CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom vendeur",
    s.location

FROM listings l

JOIN sellers s ON s.id = l.seller_id
JOIN models m ON m.id = l.model_id
JOIN brands b ON b.id = m.brand_id
JOIN categories c ON c.id = m.category_id;
```

### 2/ Même question mais cette fois je ne veux que les 20 dernières ventes

```sql
SELECT
	b.label AS brand_label,
	m.label AS model_label,
	c.label AS category_label,
    l.mileage,
    l.price,
    l.description,
    DATE_FORMAT(l.publish_at, "%d/%m/%Y - %H:%i:%s") AS publish_at,
    CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom vendeur",
    s.location

FROM listings l

JOIN sellers s ON s.id = l.seller_id
JOIN models m ON m.id = l.model_id
JOIN brands b ON b.id = m.brand_id
JOIN categories c ON c.id = m.category_id

ORDER BY l.publish_at DESC
LIMIT 20;
```

### 3/ Afficher le nombre d'annonces de vente par marque de voiture

- Ici on compte sur "l.id" pour compter les lignes de "listings" existantes. Une marque qui n'a pas de ventes aura un "l.id" à NULL, donc COUNT(l.id) vaut 0

```sql
SELECT 	COUNT(l.id) AS "Nb Ventes",
          b.label

FROM brands b

         LEFT JOIN models m ON m.brand_id = b.id
         LEFT JOIN listings l ON m.id = l.model_id

GROUP BY b.label;
```

### 4/ Même question qu'à la 1, sauf que l'on veut les 20 dernière annonces pour des renault de type Citadine ayant moins de 100000km

```sql
SELECT
    b.label AS brand_label,
    m.label AS model_label,
    c.label AS category_label,
    l.mileage,
    l.price,
    l.description,
    DATE_FORMAT(l.publish_at, "%d/%m/%Y - %H:%i:%s") AS publish_at,
    CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom vendeur",
    s.location

FROM listings l

         JOIN sellers s ON s.id = l.seller_id
         JOIN models m ON m.id = l.model_id
         JOIN brands b ON b.id = m.brand_id
         JOIN categories c ON c.id = m.category_id

WHERE   b.label = "Renault"
    AND c.label = "Citadine"
    AND l.mileage <= 100000

ORDER BY l.publish_at DESC
LIMIT 20;
```

### 5/ Même question qu'à la 4, sauf qu'il y a une limite de prix comprise entre 5000 et 9000€.

```sql
SELECT
    b.label AS brand_label,
    m.label AS model_label,
    c.label AS category_label,
    l.mileage,
    l.price,
    l.description,
    DATE_FORMAT(l.publish_at, "%d/%m/%Y - %H:%i:%s") AS publish_at,
    CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom vendeur",
    s.location

FROM listings l

         JOIN sellers s ON s.id = l.seller_id
         JOIN models m ON m.id = l.model_id
         JOIN brands b ON b.id = m.brand_id
         JOIN categories c ON c.id = m.category_id

WHERE
        b.label = "Renault"
    AND c.label = "Citadine"
    AND l.mileage <= 100000
    AND l.price BETWEEN 5000 AND 9000

ORDER BY l.publish_at DESC
LIMIT 20;
```

### 6/ Afficher les emails des vendeurs ayant passé des anonces au cours des 8 dernières années

```sql
SELECT
    s.email,
    l.publish_at

FROM sellers s

         JOIN listings l ON s.id = l.seller_id

WHERE   YEAR(l.publish_at) >= YEAR(NOW()) - 8;
```

```sql
SELECT
    s.email,
    l.publish_at

FROM sellers s

         JOIN listings l ON s.id = l.seller_id

WHERE   l.publish_at >= DATE_SUB(NOW(), INTERVAL 8 YEAR);
```

### 7/ Prix moyen des ventes sur les 8 dernières années

```sql
SELECT
	AVG(l.price)

FROM listings l
         
WHERE l.publish_at >= DATE_SUB(NOW(), INTERVAL 8 YEAR);
```

- Afficher les prix moyens par année

```sql
SELECT
	AVG(l.price),
  	YEAR(l.publish_at)

FROM listings l

GROUP BY YEAR(l.publish_at)

HAVING YEAR(l.publish_at) = 2018;
```

### 8/ Chiffre affaire par marque de voiture

```sql
SELECT
	b.label,
    SUM(l.price)

FROM brands b

JOIN models m ON m.brand_id = b.id
JOIN listings l ON l.model_id = m.id

GROUP BY b.label;
```

### 9/ Afficher le nombre d'annonces par vendeurs, en affichant le nom en majuscule et le prénom du vendeur sous le label "Nom vendeur"

- Ici on compte sur "l.id" pour compter les lignes de "listings" existantes. Un vendeur qui n'a pas de ventes aura un "l.id" à NULL, donc COUNT(l.id) vaut 0

```sql
SELECT
	s.id,
	CONCAT(UPPER(s.last_name), ' ', s.first_name) AS "Nom vendeur",
    COUNT(l.id)

FROM sellers s

LEFT JOIN listings l ON l.seller_id = s.id

GROUP BY s.id;
```
