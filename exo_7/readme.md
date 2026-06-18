
# El Moba

## Contexte

### Table `ability`

Représente les capacités (compétences) disponibles dans le jeu.

| Colonne | Type | Contrainte | Description |
|---|---|---|---|
| `id` | `INT(11)` | PK, NOT NULL, AUTO_INCREMENT | Identifiant unique de la capacité |
| `name` | `VARCHAR(255)` | NOT NULL | Nom de la capacité |
| `mana_cost` | `INT(11)` | NOT NULL | Coût en mana pour utiliser la capacité |
| `damage_min` | `INT(11)` | NOT NULL | Dégâts minimum infligés |
| `damage_max` | `INT(11)` | NOT NULL | Dégâts maximum infligés |
| `is_ulti` | `TINYINT(1)` | NOT NULL | Indique si la capacité est un ultime (1 = oui, 0 = non) |

---

### Table `hero`

Représente les héros jouables.

| Colonne | Type | Contrainte | Description |
|---|---|---|---|
| `id` | `INT(11)` | PK, NOT NULL, AUTO_INCREMENT | Identifiant unique du héros |
| `name` | `VARCHAR(255)` | NOT NULL | Nom du héros |
| `hp_max` | `INT(11)` | NOT NULL | Points de vie maximum |
| `mana_max` | `INT(11)` | NOT NULL | Points de mana maximum |
| `level` | `INT(11)` | NOT NULL | Niveau du héros |
| `attack_min` | `INT(11)` | NOT NULL | Valeur d'attaque minimale |
| `attack_max` | `INT(11)` | NOT NULL | Valeur d'attaque maximale |
| `defense` | `INT(11)` | NOT NULL | Valeur de défense |
| `ability_resistance` | `INT(11)` | NOT NULL | Résistance aux capacités adverses |

---

### Table `hero_ability`

Table de liaison (relation N:N) entre les héros et leurs capacités.

| Colonne | Type | Contrainte | Description |
|---|---|---|---|
| `id` | `INT(11)` | PK, NOT NULL, AUTO_INCREMENT | Identifiant unique de la ligne |
| `hero_id` | `INT(11)` | NOT NULL, FK → `hero.id` | Référence au héros |
| `ability_id` | `INT(11)` | NOT NULL, FK → `ability.id` | Référence à la capacité |

**Clés étrangères :**
- `hero_id` → `hero(id)`
- `ability_id` → `ability(id)`

---

### Table `map`

Représente les cartes (terrains) sur lesquelles se déroulent les parties.

| Colonne | Type | Contrainte | Description |
|---|---|---|---|
| `id` | `INT(11)` | PK, NOT NULL, AUTO_INCREMENT | Identifiant unique de la carte |
| `name` | `VARCHAR(255)` | NOT NULL | Nom de la carte |
| `height` | `INT(11)` | NOT NULL | Hauteur de la carte (en unités de jeu) |
| `width` | `INT(11)` | NOT NULL | Largeur de la carte (en unités de jeu) |

---

### Table `team`

Représente les équipes participant aux parties.

| Colonne | Type | Contrainte | Description |
|---|---|---|---|
| `id` | `INT(11)` | PK, NOT NULL, AUTO_INCREMENT | Identifiant unique de l'équipe |
| `name` | `VARCHAR(255)` | NOT NULL | Nom de l'équipe |

---

### Table `game`

Représente une partie jouée.

| Colonne | Type | Contrainte | Description |
|---|---|---|---|
| `id` | `INT(11)` | PK, NOT NULL, AUTO_INCREMENT | Identifiant unique de la partie |
| `map_id` | `INT(11)` | NOT NULL, FK → `map.id` | Carte sur laquelle la partie s'est jouée |
| `team_victory_id` | `INT(11)` | NOT NULL, FK → `team.id` | Équipe victorieuse de la partie |
| `name` | `VARCHAR(255)` | NOT NULL | Nom de la partie |
| `played_on` | `DATETIME` | NOT NULL | Date et heure à laquelle la partie a été jouée |
| `duration` | `INT(11)` | DEFAULT NULL | Durée de la partie (en minutes) — peut être NULL |

**Clés étrangères :**
- `map_id` → `map(id)`
- `team_victory_id` → `team(id)`

---

### Table `participe`

Enregistre la participation d'un héros à une partie au sein d'une équipe (table de faits).

| Colonne | Type | Contrainte | Description |
|---|---|---|---|
| `id` | `INT(11)` | PK, NOT NULL, AUTO_INCREMENT | Identifiant unique de la participation |
| `nb_kill` | `INT(11)` | NOT NULL | Nombre d'éliminations réalisées |
| `nb_death` | `INT(11)` | NOT NULL | Nombre de fois que le héros est mort |
| `nb_assistance` | `INT(11)` | NOT NULL | Nombre d'assistances réalisées |
| `hero_id` | `INT(11)` | NOT NULL, FK → `hero.id` | Héros ayant participé |
| `game_id` | `INT(11)` | NOT NULL, FK → `game.id` | Partie concernée |
| `team_id` | `INT(11)` | NOT NULL, FK → `team.id` | Équipe du héros lors de cette partie |

**Clés étrangères :**
- `hero_id` → `hero(id)`
- `game_id` → `game(id)`
- `team_id` → `team(id)`

---

### Schéma des relations

```
ability ◄─── hero_ability ───► hero
                                 │
                                 ▼
team ◄──── game ────► map    participe ────► game
  ▲          ▲                   │             │
  │          │                   ▼             ▼
  └──────────┘ (team_victory)  team           hero
                                             (via hero_id)
```

| Relation | Type | Tables concernées |
|---|---|---|
| Un héros possède plusieurs capacités | N:N | `hero` ↔ `ability` via `hero_ability` |
| Une partie se joue sur une carte | N:1 | `game` → `map` |
| Une partie est remportée par une équipe | N:1 | `game` → `team` |
| Un héros participe à une partie dans une équipe | N:N:N | `hero` × `game` × `team` via `participe` |

## Requêtes

### 1/ Afficher le contenu de la table Hero

### 2/ Ajouter un nouvel Héro avec ces informations :
- name = Vengeful Spirit
- hp_max = 1720
- mana_max = 711
- level = 25
- attack_min = 132
- attack_max = 140
- defense = 19
- ability_resistance = 25

### 3/ Créer deux nouvelles Ability avec ces informations :
- name = Magic Missile
- mana_cost = 130
- damage_min = 360
- damage_max = 360
- is_ulti = 0
Et :
- name = Wave of Terror
- mana_cost = 40
- damage_min = 120
- damage_max = 120
- is_ulti = 0

### 4/ Ajouter la relation hero_ability :
- Vengeful Spirit a Magic Missile
- Vengeful Spirit a Wave of Terror

Pour cela vous utiliserez un "insert select", en sachant que les deux noms sont uniques

### 5/ Afficher le détail d'un hero avec son/ses ability liées, par exemple :
  Nom hero | ses stats | Nom ability | ability stats
  (Une première fois sur plusieurs lignes si nécessaire et en une seule ligne par hero, sur une seule ligne vous n’afficherez pas les stats de l’ability)

### 6/ Afficher les hero n'ayant jamais participé à une game.

### 7/ Afficher les ability ayant un dégât min différent du dégât max

### 8/ Afficher le récapitulatif d'une game :
  Nom partie | Nom Team | Nom hero | Stats hero (kill/death/assistance) | 'V' si son équipe a gagné ou 'P' sinon

### 9/ Afficher le nombre de victoire par team

### 10/ Afficher le hero étant ayant le plus de nb_death au cours d'UNE game

### 11/ Afficher le hero ayant le plus de nb_kill au cours d'UNE game

### 12/ Afficher le hero ayant le plus de participe à des games

### 13/ Afficher le hero avec le plus de moyenne de nb_kill au cours de TOUTES les game

### 14/ Afficher le hero avec le plus de moyenne de nb_death au cours de TOUTES les game

### 15/ Afficher le KDA pour chaque hero
  (Le KDA est le ratio nb_assistance + nb_kill / nb_death)

### 16/ Afficher la map la plus jouée
### 17/ Afficher la game la plus longue

### 18/ Afficher la game la plus courte

### 19/ Afficher l'ability NON-ULTi, faisant le plus de damage_max

### 20/ Afficher l'ability ULTi, faisant le plus de damage_max

### 21/ Afficher l'ability ayant le meilleur ratio mana/damage :
  Formule : mana_cost / ((damage_max + damage_min) / 2) * 100
