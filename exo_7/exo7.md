### 1

```sql
SELECT *
FROM hero
```


### 2

```sql
INSERT INTO `hero`(`name`, `hp_max`, `mana_max`, `level`, `attack_min`, `attack_max`, `defense`, `ability_resistance`) VALUES ('Vengeful Spirit','1720','711','25','132','140','19','25')
```


### 3

```sql
INSERT INTO `ability`(`name`, `mana_cost`, `damage_min`, `damage_max`, `is_ulti`) VALUES ('Magic Missile','130','360','360','0');

INSERT INTO `ability`(`name`, `mana_cost`, `damage_min`, `damage_max`, `is_ulti`) VALUES ('Wave of Terror','40','120','120','0');
```


### 4

```sql
INSERT INTO `hero_ability`(`hero_id`, `ability_id`)
VALUES ((
SELECT id
FROM hero
WHERE name = "Vengeful Spirit"
),(
SELECT id
FROM ability
WHERE name = "Magic Missile"
));

INSERT INTO `hero_ability`(`hero_id`, `ability_id`)
VALUES ((
SELECT id
FROM hero
WHERE name = "Vengeful Spirit"
),(
SELECT id
FROM ability
WHERE name = "Wave of Terror"
))
```


### 5

```sql
-- Nom hero | ses stats | Nom ability | ability stats 

SELECT 
h.name,
concat('Hp max: ',h.hp_max,' Mana_max: ',h.mana_max,' ATK min: ',h.attack_min,' ATK max: ',h.attack_max,' DEF: ',h.defense,' AR: ',h.ability_resistance) Stats,
group_concat(a.name) Abilities
FROM hero h
JOIN hero_ability ha ON ha.hero_id = h.id
JOIN ability a ON a.id = ha.ability_id
GROUP BY h.name
```


### 6

```sql
SELECT 
h.name
FROM `hero` h
LEFT JOIN participe p ON p.hero_id = h.id
WHERE p.hero_id IS NULL
```


### 7

```sql
SELECT *
FROM `ability`
WHERE damage_min != damage_max
```


### 8

```sql

```


### 9

```sql

```


### 10

```sql

```


### 11

```sql

```


### 12

```sql


```
### 13

```sql

```


### 14

```sql

```


### 15

```sql

```


### 16

```sql

```


### 17

```sql

```


### 18

```sql

```


### 19

```sql

```


### 20

```sql

```


### 21

```sql

```