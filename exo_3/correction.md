
### 3/ Afficher le nombre d'annonces de vente par marque de voiture

```sql
SELECT 	COUNT(*) AS "Nb Ventes",
		b.label

FROM listings l

JOIN models m ON m.id = l.model_id
JOIN brands b ON b.id = m.brand_id

GROUP BY b.label;
```
