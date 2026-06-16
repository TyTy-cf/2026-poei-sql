### 1/ Afficher le nom des pokémons n’étant pas la forme par défaut (colonne is_default)

 SELECT * 
 FROM pokemon
  WHERE is_default =0;


### 2/ Afficher la moyenne des statistiques pour tous les pokemons (moyenne de : hp, atk, def, spa, spd et spe)

SELECT *, AVG(hp),AVG(atk),AVG(def),avg(spa),AVG(spd),AVG(spe) 
from pokemon 
GROUP BY name;


### 3/ Afficher le pokémon le plus lourd

SELECT * FROM pokemon ORDER BY weight DESC limit 1;



### 4/ Afficher le pokémon le plus petit


SELECT * FROM pokemon ORDER BY height ASC limit 1;

### 5/ Afficher le pokémon le plus lent

SELECT * FROM pokemon ORDER BY spe asc limit 1;

### 6/ Afficher les pokémons triés par "atk" décroissante, dont l’atk est supérieur à 150


SELECT * FROM pokemon WHERE atk > 150 GROUP BY atk DESC;


### 7/ Afficher la somme des statistiques avec le nom du pokémon lié



### 8/ Afficher les pokémons dont la colonne « slug » est égale au « name_api »

### 9/ Afficher les pokémons dont le name contient le mot « Mew »

### 11/ Afficher les pokémons dont le name est inférieure ou égal à 3 lettres

### 12/ Afficher le pokémon ayant la somme de statistique (hp, atk, def, spa, spd, spe) la plus élevée

### 13/ Afficher le pokémon le plus facile à monter de niveau (base_experience la plus basse)

### 14/ Afficher le rapport « efficace » pour chaque pokémon
