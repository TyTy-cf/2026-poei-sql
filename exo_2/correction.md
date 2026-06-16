

### 3/ Afficher le pokémon le plus lourd

- Solution pour TOUS les Pokémons ayant le poid MAXIMUM

```sql
SELECT * 
FROM `pokemon`
WHERE weight = (
	SELECT MAX(weight)
	FROM pokemon
);
```

- Solution pour LE Pokémon ayant le poid MAXIMUM


```sql
SELECT * 
FROM `pokemon`
ORDER BY weight DESC
LIMIT 1;
```