SELECT name FROM pokemon
WHERE is_default = 0;

SELECT



SELECT name, MAX(weight) FROM pokemon;


SELECT name, MIN(height) FROM pokemon;


SELECT MIN(spe) FROM pokemon;


SELECT name, atk FROM pokemon
WHERE atk > 150
ORDER BY atk


SELECT name, hp + atk + def + spa + spd + spe AS basestats
FROM pokemon


SELECT name FROM pokemon
WHERE
