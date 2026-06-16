-- 2-1

SELECT name FROM pokemon WHERE is_default != 1; -- 219 Lignes

-- 2-2

SELECT AVG(hp) AS avg_hp, AVG(atk) AS avg_atk, AVG(def) AS avg_def, AVG(spa) AS avg_spa, AVG(spd) AS avg_spd, AVG(spe) AS avg_spe FROM pokemon; -- 70, 80, 74, 73, 72, 69 Nice

-- 2-3

SELECT * FROM pokemon ORDER BY weight DESC LIMIT 1;
-- Venusaur-gmax

-- 2-4

SELECT * FROM pokemon ORDER BY height ASC LIMIT 1;
-- Cosmovum

-- 2-5

SELECT * FROM pokemon ORDER BY spe ASC LIMIT 1;
-- Concombaffe

-- 2-6

SELECT * FROM pokemon WHERE atk >= 150 ORDER BY atk DESC;
-- 35 lignes

-- 2-7

SELECT hp+atk+def+spa+spd+spe AS sum_stats, name FROM pokemon;

-- 2-8

SELECT * FROM pokemon WHERE slug = name_api;
-- 289 Lignes

-- 2-9

SELECT * FROM pokemon WHERE name LIKE "%Mew%";
-- 4 Lignes

-- 2-11

SELECT * FROM pokemon WHERE name LIKE "___";
-- Abo, Mew, Tic

-- 2-12

SELECT *, hp+atk+def+spa+spd+spe AS sum_stats FROM pokemon ORDER BY hp+atk+def+spa+spd+spe DESC LIMIT 1;
-- Eternatus-eternamax

-- 2-13

SELECT * FROM pokemon ORDER BY base_experience LIMIT 1;
-- Larvadar

-- 2-14

SELECT name, CONCAT(ROUND((base_experience / (hp+atk+def+spa+spd+spe))*100, 2), "%") AS rapport FROM pokemon ORDER BY ROUND((base_experience / (hp+atk+def+spa+spd+spe))*100, 2) DESC;