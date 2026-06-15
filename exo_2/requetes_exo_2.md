### 1/ Afficher le nom des pokémons n’étant pas la forme par défaut (colonne is_default)

```sql
SELECT name
FROM pokemon
WHERE is_default = 0;
```

### 2/ Afficher la moyenne des statistiques pour tous les pokemons (moyenne de : hp, atk, def, spa, spd et spe)

```sql
SELECT AVG(hp + atk + def + spa + spd + spe) / 6 AS moyenne_generale
FROM pokemon;
```

### 3/ Afficher le pokémon le plus lourd

```sql
SELECT name, weight
FROM pokemon
WHERE weight = (SELECT MAX(weight) FROM pokemon) LIMIT 1;
```

### 4/ Afficher le pokémon le plus petit

```sql
SELECT name, height
FROM pokemon
WHERE height = (SELECT MIN(height) FROM pokemon) LIMIT 1;
```

### 5/ Afficher le pokémon le plus lent

```sql
SELECT name, spe
FROM pokemon
WHERE spe = (SELECT MIN(spe) FROM pokemon) LIMIT 1;
```

### 6/ Afficher les pokémons triés par "atk" décroissante, dont l’atk est supérieur à 150

```sql
SELECT name, atk
FROM pokemon
WHERE atk > 150
ORDER BY atk DESC;
```

### 7/ Afficher la somme des statistiques avec le nom du pokémon lié

```sql
SELECT name, (hp + atk + def + spa + spd + spe) AS somme_stats
FROM pokemon;
```

### 8/ Afficher les pokémons dont la colonne « slug » est égale au « name_api »

```sql
SELECT name
FROM pokemon
WHERE slug = name_api;
```

### 9/ Afficher les pokémons dont le name contient le mot « Mew »

```sql
SELECT name
FROM pokemon
WHERE name LIKE '%Mew%';
```

### 11/ Afficher les pokémons dont le name est inférieure ou égal à 3 lettres

```sql
SELECT name
FROM pokemon
WHERE LENGTH(name) <= 3;
```

### 12/ Afficher le pokémon ayant la somme de statistique (hp, atk, def, spa, spd, spe) la plus élevée

```sql
SELECT name, (hp + atk + def + spa + spd + spe) AS total_stats
FROM pokemon
WHERE (hp + atk + def + spa + spd + spe) = (SELECT MAX(hp + atk + def + spa + spd + spe)
                                            FROM pokemon);
```

### 13/ Afficher le pokémon le plus facile à monter de niveau (base_experience la plus basse)

```sql
SELECT name, base_experience
FROM pokemon
WHERE base_experience = (SELECT MIN(base_experience) FROM pokemon) LIMIT 1;
```

### 14/ Afficher le rapport « efficace » pour chaque pokémon

- Rapport efficace : (somme des base_experience / statistiques) * 100
  (arrondie à 2 après la virgule et avec un % à la fin)

```sql

```
