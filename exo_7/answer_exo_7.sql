-- 1/ Afficher le contenu de la table Hero

-- 2/ Ajouter un nouvel Héro avec ces informations :
    -- name = Vengeful Spirit
    -- hp_max = 1720
    -- mana_max = 711
    -- level = 25
    -- attack_min = 132
    -- attack_max = 140
    -- defense = 19
     -- ability_resistance = 25

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

---- 4/ Ajouter la relation hero_ability :
-- Vengeful Spirit a Magic Missile
-- Vengeful Spirit a Wave of Terror

-- Pour cela vous utiliserez un "insert select", en sachant que les deux noms sont uniques

-- 5/ Afficher le détail d'un hero avec son/ses ability liées, par exemple :
  --Nom hero | ses stats | Nom ability | ability stats
  --(Une première fois sur plusieurs lignes si nécessaire et en une seule ligne par hero, sur une seule ligne vous n’afficherez pas les stats de l’ability)

-- 6/ Afficher les hero n'ayant jamais participé à une game.

-- 7/ Afficher les ability ayant un dégât min différent du dégât max

-- 8/ Afficher le récapitulatif d'une game :
  --Nom partie | Nom Team | Nom hero | Stats hero (kill/death/assistance) | 'V' si son équipe a gagné ou 'P' sinon

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
