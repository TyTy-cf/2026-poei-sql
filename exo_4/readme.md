
# STEAMISH

## 1. Dictionnaire de données

La base de données `db_steamish` modélise une plateforme de distribution de jeux vidéo (inspirée de Steam). Elle gère des comptes utilisateurs, des jeux vidéo, des éditeurs, des genres, des pays, une bibliothèque personnelle par utilisateur et un système de commentaires.

### Inventaire des tables

| Table | Rôle                                                  |
|---|-------------------------------------------------------|
| `account` | Comptes utilisateurs de la plateforme                 |
| `country` | Référentiel des pays                                  |
| `publisher` | Éditeurs de jeux vidéo                                |
| `game` | Jeux vidéo disponibles sur la plateforme              |
| `genre` | Genres de jeux vidéo                                  |
| `game_genre` | Association jeux ↔ genres (table relationnelle)       |
| `game_country` | Association jeux ↔ pays de disponibilité (table relationnelle)        |
| `library` | Bibliothèque de jeux par compte utilisateur           |
| `comment` | Commentaires postés par les utilisateurs sur les jeux |

---

### Table `account`

Contient les informations des utilisateurs inscrits sur la plateforme.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique du compte |
| `username` | `varchar(255)` | NOT NULL | Nom d'utilisateur (pseudo affiché) |
| `email` | `varchar(255)` | NOT NULL | Adresse email du compte |
| `display_name` | `varchar(255)` | NOT NULL | Nom d'affichage public |
| `country_id` | `int(11)` | NULL autorisé, FK → `country.id` | Pays de résidence de l'utilisateur |
| `slug` | `varchar(255)` | NOT NULL | Identifiant URL-friendly du compte |
| `created_at` | `datetime` | NOT NULL | Date et heure de création du compte |
| `role` | `int(11)` | NULL autorisé | Rôle de l'utilisateur (ex : `1` = admin, valeurs entières) |
| `avatar` | `varchar(255)` | NULL autorisé | URL ou chemin de l'avatar (peut être vide) |
| `password` | `varchar(255)` | NOT NULL | Mot de passe hashé (bcrypt) |
| `phone` | `varchar(255)` | NULL autorisé | Numéro de téléphone |
| `deleted_at` | `datetime` | NULL autorisé | Date de suppression logique du compte (`NULL` = compte actif) |

---

### Table `country`

Référentiel des pays, utilisé pour les comptes utilisateurs et la disponibilité des jeux.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique du pays |
| `name` | `varchar(128)` | NOT NULL | Nom du pays (ex : `France`, `Royaume-Uni`) |
| `nationality` | `varchar(128)` | NOT NULL | Nationalité associée (ex : `Français`, `Anglais`) |
| `url_flag` | `varchar(255)` | NULL autorisé | URL de l'image du drapeau |
| `code` | `varchar(2)` | NOT NULL | Code ISO 3166-1 alpha-2 (ex : `fr`, `gb`, `us`) |
| `slug` | `varchar(255)` | NOT NULL, UNIQUE | Identifiant URL-friendly (ex : `Francais`, `Anglais`) |

---

### Table `publisher`

Éditeurs ou développeurs de jeux vidéo présents sur la plateforme.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique de l'éditeur |
| `country_id` | `int(11)` | NULL autorisé, FK → `country.id` | Pays d'origine de l'éditeur |
| `name` | `varchar(180)` | NOT NULL | Nom officiel de l'éditeur (ex : `Blizzard Entertainment`) |
| `website` | `varchar(180)` | NOT NULL | URL du site officiel |
| `slug` | `varchar(255)` | NOT NULL, UNIQUE | Identifiant URL-friendly (ex : `Blizzard-Entertainment`) |
| `created_at` | `datetime` | NOT NULL | Date de création ou d'enregistrement de l'éditeur |

---

### Table `game`

Jeux vidéo disponibles sur la plateforme.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique du jeu |
| `publisher_id` | `int(11)` | NULL autorisé, FK → `publisher.id` | Référence à l'éditeur du jeu |
| `name` | `varchar(255)` | NULL autorisé | Titre du jeu |
| `price` | `double` | NOT NULL | Prix du jeu en euros |
| `published_at` | `datetime` | NOT NULL | Date et heure de publication du jeu |
| `description` | `longtext` | NOT NULL | Description complète du jeu |
| `thumbnail_cover` | `varchar(255)` | NULL autorisé | URL de l'image de couverture |
| `thumbnail_logo` | `varchar(255)` | NULL autorisé | URL du logo du jeu |
| `slug` | `varchar(255)` | NOT NULL, UNIQUE | Identifiant URL-friendly du jeu (ex : `World-of-Warcraft`) |

---

### Table `genre`

Référentiel des genres de jeux vidéo.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique du genre |
| `name` | `varchar(128)` | NOT NULL | Nom du genre (ex : `RPG`, `FPS`, `Stratégie`) |
| `slug` | `varchar(255)` | NOT NULL, UNIQUE | Identifiant URL-friendly (ex : `RPG`, `FPS`) |

---

### Table `game_genre`

Table de jointure représentant la relation N:N entre les jeux et les genres.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `game_id` | `int(11)` | PK (composite), FK → `game.id` | Référence au jeu |
| `genre_id` | `int(11)` | PK (composite), FK → `genre.id` | Référence au genre |

---

### Table `game_country`

Table de jointure représentant les pays dans lesquels un jeu est disponible (N:N).

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `game_id` | `int(11)` | PK (composite), FK → `game.id` | Référence au jeu |
| `country_id` | `int(11)` | PK (composite), FK → `country.id` | Référence au pays de disponibilité |

---

### Table `library`

Représente la bibliothèque personnelle de chaque utilisateur : les jeux qu'il possède, son temps de jeu, etc.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique de l'entrée de bibliothèque |
| `game_id` | `int(11)` | NULL autorisé, FK → `game.id` | Référence au jeu |
| `account_id` | `int(11)` | NULL autorisé, FK → `account.id` | Référence au compte propriétaire |
| `installed` | `tinyint(1)` | NOT NULL, DEFAULT `0` | Indique si le jeu est installé (`1` = oui, `0` = non) |
| `game_time` | `int(11)` | NOT NULL, DEFAULT `0` | Temps de jeu cumulé en secondes |
| `last_used_at` | `datetime` | NOT NULL | Date et heure de la dernière session de jeu |
| `created_at` | `datetime` | NOT NULL | Date et heure d'ajout du jeu à la bibliothèque |

---

### Table `comment`

Commentaires et avis postés par les utilisateurs sur les jeux.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique du commentaire |
| `account_id` | `int(11)` | NOT NULL, FK → `account.id` | Référence au compte auteur |
| `game_id` | `int(11)` | NOT NULL, FK → `game.id` | Référence au jeu commenté |
| `content` | `longtext` | NOT NULL | Contenu textuel du commentaire |
| `upvotes` | `int(11)` | NOT NULL | Nombre de votes positifs reçus |
| `downvotes` | `int(11)` | NOT NULL | Nombre de votes négatifs reçus |
| `created_at` | `datetime` | NOT NULL | Date et heure de publication du commentaire |
| `rank` | `double` | NOT NULL | Score calculé de pertinence ou de classement du commentaire |

---

## 2. Requêtes

### 1/ Afficher les jeux (table : games), triés par ordre de date de sortie (publishedAt)

### 2/ Afficher tous les jeux les plus cher (ceux ayant le prix maximum)

### 3/ En reprenant la requête de la question 1, afficher uniquement les jeux ayant au moins le style FPS

### 4/ Affichez le temps de jeu total par nom de compte

### 5/ Afficher par compte, le nombre de jeux installés qu'il possède, sur son nombre de jeu total (ex : 4/6 ; is_installed = 1)

### 6/ Afficher la valeur (somme du prix des jeux) de la bibliothèque (library) d'un compte (account)

### 7/ Afficher les nicknames utilisés plusieurs fois

### 8/ Afficher par jeux, le nombre de fois où il a été acheté

### 9/ Afficher par jeux, son revenu total à son éditeur

### 10/ Afficher par genre, son nombre de fois où il a été vendu

### 11/ Afficher le top 3 des jeux les plus vendu

### 12/ Afficher le top 3 des jeux les plus joués (temps de jeu cumulé parmi toutes les library les plus élevé)

### 13/ Afficher les différents jeux par année, sous une même colonne

### 14/ Le jeu le plus ancien

### 15/ Afficher les jeux avec leur note moyenne (table comment, colonne rank)

### 16/ Afficher le jeu ayant le plus de commentaire négatif (colonne down_votes)

### 17/ Afficher les jeux dont la moyenne des commentaires (rank) est supérieur à la moyenne globale

### 18/ Afficher les account n’ayant jamais acheté de jeu

### 19/ Afficher le genre le plus acheté

**STOP ICI**

---

### 20/ Afficher les noms de compte ayant acheté un jeu, qui n’est pas dans leur langue natale.

### 21/ Afficher le ratio de présence des accounts par pays dans l’application

### 22/ Faire une requête pour supprimer les doublons de la table libraries (paire game_id et account_id)

### 23/ Faire une requête pour afficher les utilisateurs qui ont mis des commentaires à des jeux non présents dans leur bibliothèque

### 24/ Afficher les jeux dont leur total de downvote supérieur au total d'upvotes, MAIS un rank supérieur à la moyenne globale des rank de tous les commentaires