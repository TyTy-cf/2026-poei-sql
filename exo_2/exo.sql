-- 1

SELECT name
FROM pokemon
WHERE is_default = 0;

-- 2

SELECT AVG(hp) AS avg_hp, 
AVG(atk) AS avg_atk, 
AVG(def) AS avg_def, 
AVG(spa) AS avg_spa, 
AVG(spd) AS avg_spd, 
AVG(spe) AS avg_spe
FROM pokemon;

-- 3

SELECT *
FROM pokemon
ORDER BY weight DESC
LIMIT 1;

-- 4

SELECT *
FROM pokemon
ORDER BY height ASC
LIMIT 1;

--5

SELECT *
FROM pokemon
ORDER BY spe ASC
LIMIT 1;

-- 6

SELECT *
FROM pokemon
WHERE atk > 150
ORDER BY spa DESC;


-- 7

SELECT *, hp+atk+def+spa+spd+spe AS total_stats
FROM pokemon;

-- 8

SELECT *
FROM pokemon
WHERE slug = name_api;

-- 9

SELECT *
FROM pokemon
WHERE name LIKE "%Mew%";

-- 10

SELECT *, LENGTH(name) AS char_length
FROM pokemon
HAVING char_length <= 3;

-- 11

SELECT *, hp+atk+def+spa+spd+spe AS total_stats
FROM pokemon
ORDER BY total_stats DESC LIMIT 1;

-- 12

SELECT *
FROM pokemon
ORDER BY base_experience ASC LIMIT 1;

-- 13

SELECT name, CONCAT(ROUND(base_experience/(hp+atk+def+spa+spd+spe), 2), "%") AS total_stats
FROM pokemon;