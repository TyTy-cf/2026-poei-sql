SELECT name
FROM `pokemon`
WHERE is_default = 0;
-- 2) ---------------
SELECT CONCAT(
               'hp:', FORMAT(AVG(hp), 1),
               ', atk:', FORMAT(AVG(atk), 1),
               ', def:', FORMAT(AVG(def), 1),
               ', spa:', FORMAT(AVG(spa), 1),
               ', spd:', FORMAT(AVG(spd), 1),
               ', spe:', FORMAT(AVG(spe), 1)
       ) AS average_stats
FROM pokemon;

-- 3) -----------------------
SELECT name, weight FROM pokemon
WHERE weight = Max(weight)
ORDER BY weight DESC, name ASC
  LIMIT 1 ;


SELECT name, weight
FROM pokemon
WHERE weight = (
    SELECT MAX(weight)
    FROM pokemon
)
ORDER BY name ASC;

-- 4 ------------------
SELECT name, height
FROM pokemon
ORDER BY height ASC ,name ASC
    LIMIT 1;

-- 5)---------------------
SELECT name, spe
FROM pokemon
WHERE spe = (
    SELECT MIN(spe)
    FROM pokemon
)
ORDER BY name ASC
    LIMIT 1;

-- 6) ----------

SELECT *FROM pokemon
WHERE atk > 150
ORDER BY atk DESC;

-- 7) -----------
SELECT * FROM  pokemon
WHERE slug = name_api;


