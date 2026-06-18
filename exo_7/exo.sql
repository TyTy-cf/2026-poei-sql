-- 1

SELECT *
FROM hero;

-- 2

INSERT INTO hero (
    id,
    name,
    hp_max,
    mana_max,
    level,
    attack_min,
    attack_max,
    defense,
    ability_resistance
)
VALUES (
    NULL,
    "Vengeful Spirit",
    1720,
    711,
    25,
    132,
    140,
    19,
    25
);

-- 3

INSERT INTO ability (
    id,
    name,
    mana_cost,
    damage_min,
    damage_max,
    is_ulti
)
VALUES (
    NULL,
    "Magic Missile",
    130,
    360,
    360,
    0
),
(
    NULL,
    "Wave of Terror",
    40,
    120,
    120,
    0
);

-- 4

INSERT INTO hero_ability (
    id,
    hero_id,
    ability_id
)
VALUES (
    NULL,
    (
        SELECT id
        FROM hero
        WHERE name = "Vengeful Spirit"
    ),
    (
        SELECT id
        FROM ability
        WHERE name = "Magic Missile"
    )
),
(
    NULL,
    (
        SELECT id
        FROM hero
        WHERE name = "Vengeful Spirit"
    ),
    (
        SELECT id
        FROM ability
        WHERE name = "Wave of Terror"
    )
);

-- 5

SELECT
    h.name AS "Nom Héros",
    CONCAT(
        "PV Max : ", h.hp_max,
        " Mana Max : ", h.mana_max,
        " Niveau : ", h.level,
        " Attaque Min : ", h.attack_min,
        " Attaque Max : ", h.attack_max,
        " Résistance aux capacités : ", h.ability_resistance
    ) AS "Statistiques du héros",
    GROUP_CONCAT(
        a.name, " "
    ) AS "Capacités"
FROM hero AS h
JOIN hero_ability AS ha ON ha.hero_id = h.id
JOIN ability AS a ON a.id = ha.ability_id
GROUP BY h.id;

-- 6

SELECT
    h.name
FROM hero AS h
JOIN participe AS p ON p.hero_id = h.id
WHERE name NOT IN (
    SELECT
        h.name
    FROM hero
    HAVING COUNT(p.hero_id) > 0
);