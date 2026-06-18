-- 1/ Afficher le contenu de la table Hero
SELECT * FROM hero
-- 2/ Ajouter un nouvel Héro avec ces informations :
    -- name = Vengeful Spirit
    -- hp_max = 1720
    -- mana_max = 711
    -- level = 25
    -- attack_min = 132
    -- attack_max = 140
    -- defense = 19
     -- ability_resistance = 25
INSERT INTO hero (name, hp_max, mana_max, level, attack_min, attack_max, defense, ability_resistance)
VALUES ('Vengeful Spirit', 1720, 711, 25, 132, 140, 19, 25)

-- 3/ Créer deux nouvelles Ability avec ces informations :
    -- name = Magic Missile
    -- mana_cost = 130
    -- damage_min = 360
    -- damage_max = 360
    -- is_ulti = 0
    --Et :
    -- name = Wave of Terror
    -- mana_cost = 40
    -- damage_min = 120
    -- damage_max = 120
    -- is_ulti = 0
INSERT INTO ability (name, mana_cost, damage_min, damage_max, is_ulti)
VALUES ('Magic Missile', 130, 360, 360, 0),
       ('Wave of Terror', 40, 120, 120, 0)

-- 4/ Ajouter la relation hero_ability :
    -- Pour cela vous utiliserez un "insert select", en sachant que les deux noms sont uniques
        -- Vengeful Spirit a Magic Missile
        -- Vengeful Spirit a Wave of Terror
INSERT INTO hero_ability (hero_id, ability_id)
SELECT h.id, a.id
FROM hero h
JOIN ability a ON h.name = 'Vengeful Spirit' AND a.name IN ('Magic Missile', 'Wave of Terror')


-- 5/ Afficher le détail d'un hero avec son/ses ability liées, par exemple :
  --Nom hero | ses stats | Nom ability | ability stats
  --(Une première fois sur plusieurs lignes si nécessaire et en une seule ligne par hero, sur une seule ligne vous n’afficherez pas les stats de l’ability)
SELECT
    h.name as "Nom hero",
    CONCAT(
    h.hp_max, ' | ', 
    h.mana_max, ' | ', 
    h.level, ' | ', 
    h.attack_min, ' | ', 
    h.attack_max, ' | ', 
    h.defense, ' | ', 
    h.ability_resistance, ' | ', 
    (SELECT 
    GROUP_CONCAT(CONCAT(a.name) SEPARATOR ' | ') 
    FROM hero_ability ha2 
    JOIN ability a ON ha2.ability_id = a.id 
    WHERE ha2.hero_id = h.id)) AS hero_stats
FROM hero h
LEFT JOIN hero_ability ha ON h.id = ha.hero_id
LEFT JOIN ability a ON ha.ability_id = a.id


-- 6/ Afficher les hero n'ayant jamais participé à une game.
/*
SELECT 
    h.name AS hero_name
FROM hero h
WHERE h.id NOT IN (
    SELECT hero_id
    FROM participe
)
*/
SELECT 
    h.name AS hero_name
FROM hero h
LEFT JOIN participe p ON h.id = p.hero_id
WHERE p.hero_id IS NULL

-- 7/ Afficher les ability ayant un dégât min différent du dégât max
SELECT * FROM ability WHERE damage_min != damage_max

-- 8/ Afficher le récapitulatif d'une game :
  --Nom partie | Nom Team | Nom hero | Stats hero (kill/death/assistance) | 'V' si son équipe a gagné ou 'P' sinon
SELECT 
    g.name AS "Nom partie",
    t.name AS "Nom Team",
    h.name AS "Nom hero",
    CONCAT("(", p.nb_kill, "/", p.nb_death, "/", p.nb_assistance, ")") AS "Stats hero",
    IF (p.team_id = g.team_victory_id, 'V', 'P') AS "Résultat"
FROM game g
JOIN participe p ON g.id = p.game_id
JOIN team t ON p.team_id = t.id 
JOIN hero h ON p.hero_id = h.id

-- 9/ Afficher le nombre de victoire par team

-- 10/ Afficher le hero étant ayant le plus de nb_death au cours d'UNE game

-- 11/ Afficher le hero ayant le plus de nb_kill au cours d'UNE game

-- 12/ Afficher le hero ayant le plus de participe à des games

-- 13/ Afficher le hero avec le plus de moyenne de nb_kill au cours de TOUTES les game

-- 14/ Afficher le hero avec le plus de moyenne de nb_death au cours de TOUTES les game

-- 15/ Afficher le KDA pour chaque hero
  --(Le KDA est le ratio nb_assistance + nb_kill / nb_death)

-- 16/ Afficher la map la plus jouée
-- 17/ Afficher la game la plus longue

-- 18/ Afficher la game la plus courte

-- 19/ Afficher l'ability NON--ULTi, faisant le plus de damage_max

-- 20/ Afficher l'ability ULTi, faisant le plus de damage_max

-- 21/ Afficher l'ability ayant le meilleur ratio mana/damage :
  --Formule : mana_cost / ((damage_max + damage_min) / 2) * 100
