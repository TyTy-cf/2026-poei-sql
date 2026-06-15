--  (1117, 10000, 260, 275, 100, 130, 100, 63, 60, 97, 'Urshifu-rapid-strike-gmax', 'urshifu-rapid-strike-gmax', '10219', 'urshifu-rapid-strike-gmax', 0);
--

#1
SELECT * FROM pokemon WHERE is_default != 1;

#2
SELECT AVG(hp),AVG(atk),AVG(def),AVG(spa),AVG(spd),AVG(spe) FROM pokemon;

#3
SELECT * FROM pokemon ORDER BY height DESC LIMIT 1;

#4
SELECT * FROM pokemon ORDER BY height ASC LIMIT 1;

#5
SELECT * FROM pokemon ORDER BY spe ASC LIMIT 1;

#6
SELECT * FROM pokemon WHERE atk > 150 ORDER BY atk DESC;

#7
SELECT SUM(HP + ATK + DEF + SPA + SPD + SPE) AS total_stats, name FROM pokemon GROUP BY name;

#8
SELECT * FROM pokemon WHERE slug = name_api;

#9
SELECT * FROM pokemon WHERE name LIKE "%Mew%";

#10
SELECT * FROM pokemon WHERE LENGTH(name) <= 3;

#9

#11
#12
#13
#14
