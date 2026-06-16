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







### 2/ Même question mais cette fois je ne veux que les 20 dernières ventes



### 3/ Afficher le nombre d'annonces de vente par marque de voiture

select count(*)
from listings
join models on modes.id = listings.model_id
join brands on brands.id = models.brand_id
group by b.label 





### 4/ Même question qu'à la 3, sauf que l'on veut les 20 dernière annonces pour des renault de type Citadine ayant moins de 100000km

select count(*)
from listings
join models on modes.id = listings.model_id
join brands on brands.id = models.brand_id

WHERE brands.label ='renault' and categories.label ='Citadine' AND listings.mileage < 1000000
LIMIT 20


### 5/ Même question qu'à la 3, sauf qu'il y a une limite de prix comprise entre 5000 et 9000€.

select *
from listings



### 6/ Afficher les emails des vendeurs ayant passé des anonces au cours des 12 derniers mois

### 6/ Afficher les emails des vendeurs ayant passé des anonces au cours des 12 derniers mois
SELECT sellers.email
FROM sellers
JOIN listings ON sellers.id = listings.seller_id

WHERE  NOW() < listings.publish_at 


### 7/ Prix moyen des ventes sur les 5 dernières années





### 8/ Chiffre affaire par marque de voiture





### 9/ Afficher le nombre d'annonces par vendeurs, en affichant le nom en majuscule et le prénom du vendeur sous le label "Nom vendeur"