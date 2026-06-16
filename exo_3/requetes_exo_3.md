### 1/ Afficher Une liste des ventes

On affichera que les informations suivantes :

- Le label de la marque (brands)
- Le label du modèle (models)
- Le label de la catégorie (categories)
- L'année de production du véhicule
- Le prix du véhicule
- La description du produit
- La date de publication de la vente au format JJ/MM/AAAA - HH:mm:ss
- Le nom en majuscule et le prénom du vendeur sous le label "Nom vendeur"
- L'adresse du vendeur

```sql
SELECT brands.label AS 'Marque', models.label AS 'Modèle', categories.label AS 'Catégorie', listings.produce_year AS 'Année de production', listings.price AS 'Prix', listings.description AS 'Description', DATE_FORMAT(listings.publish_at, '%d/%m/%Y - %H:%i:%s') AS 'Date de publication', CONCAT(UPPER(sellers.last_name), ' ', sellers.first_name) AS 'Nom vendeur', sellers.location AS 'Adresse du vendeur'
FROM listings
         JOIN models ON listings.model_id = models.id
         JOIN brands ON models.brand_id = brands.id
         JOIN categories ON models.category_id = categories.id
         JOIN sellers ON listings.seller_id = sellers.id;
```

### 2/ Même question, mais cette fois, je ne veux que les 20 dernières ventes

```sql
SELECT brands.label AS 'Marque', models.label AS 'Modèle', categories.label AS 'Catégorie', listings.produce_year AS 'Année de production', listings.price AS 'Prix', listings.description AS 'Description', DATE_FORMAT(listings.publish_at, '%d/%m/%Y - %H:%i:%s') AS 'Date de publication', CONCAT(UPPER(sellers.last_name), ' ', sellers.first_name) AS 'Nom vendeur', sellers.location AS 'Adresse du vendeur'
FROM listings
         JOIN models ON listings.model_id = models.id
         JOIN brands ON models.brand_id = brands.id
         JOIN categories ON models.category_id = categories.id
         JOIN sellers ON listings.seller_id = sellers.id
ORDER BY publish_at DESC LIMIT 20;
```

### 3/ Afficher le nombre d'annonces de vente par marque de voiture

```sql
SELECT brands.label, COUNT(listings.id) AS 'Nombre annonces'
FROM brands
         JOIN models ON brands.id = models.brand_id
         JOIN listings ON models.id = listings.model_id
GROUP BY brands.label;
```

ou

```sql
SELECT COUNT(*) AS 'Nombre annonces', b.label
FROM listings l
         JOIN models m ON m.id = l.models_id
         JOIN brands b ON b.id = m.brands_id
GROUP BY b.label;
```

### 4/ Même question qu'à la 1, sauf que l'on veut les 20 dernières annonces pour des Renault de type Citadine ayant moins de 100000km

```sql
SELECT brands.label AS 'Marque', models.label AS 'Modèle', categories.label AS 'Catégorie', listings.produce_year AS 'Année de production', listings.price AS 'Prix', listings.description AS 'Description', DATE_FORMAT(listings.publish_at, '%d/%m/%Y - %H:%i:%s') AS 'Date de publication', CONCAT(UPPER(sellers.last_name), ' ', sellers.first_name) AS 'Nom vendeur', sellers.location AS 'Adresse du vendeur'
FROM listings
         JOIN models ON listings.model_id = models.id
         JOIN brands ON models.brand_id = brands.id
         JOIN categories ON models.category_id = categories.id
         JOIN sellers ON listings.seller_id = sellers.id
WHERE brands.label = 'Renault'
  AND categories.label = 'Citadine'
  AND listings.mileage < 100000
ORDER BY listings.publish_at DESC LIMIT 20;
```

### 5/ Même question qu'à la 4, sauf qu'il y a une limite de prix comprise entre 5000 et 9000€.

```sql
SELECT brands.label AS 'Marque', models.label AS 'Modèle', categories.label AS 'Catégorie', listings.produce_year AS 'Année de production', listings.price AS 'Prix', listings.description AS 'Description', DATE_FORMAT(listings.publish_at, '%d/%m/%Y - %H:%i:%s') AS 'Date de publication', CONCAT(UPPER(sellers.last_name), ' ', sellers.first_name) AS 'Nom vendeur', sellers.location AS 'Adresse du vendeur'
FROM listings
         JOIN models ON listings.model_id = models.id
         JOIN brands ON models.brand_id = brands.id
         JOIN categories ON models.category_id = categories.id
         JOIN sellers ON listings.seller_id = sellers.id
WHERE brands.label = 'Renault'
  AND categories.label = 'Citadine'
  AND listings.mileage < 100000
  AND listings.price >= 5000
  AND listings.price <= 9000
ORDER BY listings.publish_at DESC LIMIT 20;
```

### 6/ Afficher les emails des vendeurs ayant passé des anonces au cours des 8 dernières années

```sql
SELECT sellers.email
FROM sellers
         JOIN listings ON sellers.id = listings.seller_id
WHERE listings.publish_at >= DATE_SUB(NOW(), INTERVAL 8 YEAR);
```

### 7/ Prix moyen des ventes sur les 12 dernières années

```sql
SELECT AVG(price) AS 'Prix moyen'
FROM listings
WHERE publish_at >= DATE_SUB(NOW(), INTERVAL 12 YEAR);
```

### 8/ Chiffre affaire par marque de voiture

```sql
SELECT brands.label, SUM(listings.price) AS 'Chiffre affaire'
FROM brands
         JOIN models ON brands.id = models.brand_id
         JOIN listings ON models.id = listings.model_id
GROUP BY brands.label;
```

### 9/ Afficher le nombre d'annonces par vendeurs, en affichant le nom en majuscule et le prénom du vendeur sous le label "Nom vendeur"

```sql
SELECT CONCAT(UPPER(sellers.last_name), ' ', sellers.first_name) AS 'Nom vendeur', COUNT(listings.id) AS 'Nombre annonces'
FROM sellers
         LEFT JOIN listings ON sellers.id = listings.seller_id
GROUP BY sellers.id;
```