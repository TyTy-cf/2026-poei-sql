-- 1/ Afficher Une liste des ventes
SELECT 
    b.label as brand, 
    m.label as model, 
    c.label as category, 
    l.produce_year, 
    l.price,
    l.description,
    l.publish_at,
    CONCAT(UPPER(s.first_name), " ", s.last_name) as "Nom vendeur",
    s.location

FROM listings as l
JOIN sellers AS s ON s.id = l.seller_id
JOIN models AS m ON m.id = l.model_id
JOIN brands AS b ON b.id = m.brand_id
JOIN categories AS c ON c.id = m.category_id;

-- 2/ Même question mais cette fois je ne veux que les 20 dernières ventes
SELECT 
    b.label, 
    m.label, 
    c.label, 
    l.produce_year, 
    l.price,
    l.description,
    l.publish_at,
    CONCAT(UPPER(s.first_name), " ", s.last_name) as "Nom vendeur",
    s.location as vendor_adress

FROM listings as l
JOIN sellers AS s ON s.id = l.seller_id
JOIN models AS m ON m.id = l.model_id
JOIN brands AS b ON b.id = m.brand_id
JOIN categories AS c ON c.id = m.category_id
LIMIT 20;

-- 3/ Afficher le nombre d'annonces de vente par marque de voiture
SELECT 
    b.label,
    COUNT(*) as nbr_listings

FROM listings as l
JOIN models AS m ON m.id = l.model_id
JOIN brands AS b ON b.id = m.brand_id
GROUP BY b.label;

-- 4/ Même question qu'à la 1, sauf que l'on veut les 20 dernière annonces pour des renault de type Citadine ayant moins de 100000km
    

-- 5/ Même question qu'à la 5, sauf qu'il y a une limite de prix comprise entre 5000 et 9000€.

-- 6/ Afficher les emails des vendeurs ayant passé des anonces au cours des 12 derniers mois

-- 7/ Prix moyen des ventes sur les 5 dernières années

-- 8/ Chiffre affaire par marque de voiture

-- 9/ Afficher le nombre d'annonces par vendeurs, en affichant le nom en majuscule et le prénom du vendeur sous le label "Nom vendeur"