
# SPOTIFISH

## 1. Dictionnaire de données

### Vue d'ensemble

La base de données `db_spotifish` modélise une plateforme de streaming musical. Elle gère des comptes utilisateurs, des abonnements, des artistes, des albums, des chansons et des playlists.

### Tables

| Table | Rôle                                                |
|---|-----------------------------------------------------|
| `account` | Comptes utilisateurs de la plateforme               |
| `subscription` | Types d'abonnements disponibles                     |
| `account_subscription` | Historique des abonnements d'un compte              |
| `artist` | Artistes musicaux                                   |
| `album` | Albums publiés par des artistes                     |
| `song` | Chansons                                            |
| `album_song` | Association albums ↔ chansons (table relationnelle) |
| `playlist` | Playlists créées par les utilisateurs               |
| `playlist_song` | Association playlists ↔ chansons (table relationnelle)              |
| `account_like_playlist` | Association comptes ↔ playlists aimées (table relationnelle)        |

---

### Table `account`

Contient les informations des utilisateurs inscrits sur la plateforme.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique du compte |
| `birth_date` | `date` | NULL autorisé | Date de naissance de l'utilisateur |
| `created_at` | `datetime` | NOT NULL | Date et heure de création du compte |
| `email` | `varchar(255)` | NOT NULL | Adresse email (identifiant de connexion) |
| `gender` | `varchar(2)` | NOT NULL | Genre (`H` = Homme, `F` = Femme, `NB` = Non-binaire, `NR` = Non renseigné) |
| `name` | `varchar(255)` | NOT NULL | Nom d'utilisateur / pseudo |
| `newsletter` | `tinyint(1)` | NOT NULL | Abonnement à la newsletter (`1` = oui, `0` = non) |
| `password` | `varchar(255)` | NOT NULL | Mot de passe hashé (algorithme Argon2id) |

---

### Table `subscription`

Référentiel des offres d'abonnement proposées sur la plateforme.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique de l'abonnement |
| `name` | `varchar(255)` | NOT NULL | Nom de l'offre (`Free`, `Premium`, `Famille`) |
| `cost` | `double` | NOT NULL | Coût mensuel en euros (ex: `0`, `11.99`, `14.99`) |

---

### Table `account_subscription`

Historique des souscriptions d'abonnement par compte utilisateur. Permet de tracer les changements d'offre dans le temps.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique de l'entrée |
| `account_id` | `int(11)` | NOT NULL, FK → `account.id` | Référence au compte concerné |
| `subscription_id` | `int(11)` | NOT NULL, FK → `subscription.id` | Référence à l'abonnement souscrit |
| `effective_at` | `datetime` | NOT NULL | Date et heure de début de l'abonnement |
| `finished_at` | `datetime` | NULL autorisé | Date et heure de fin de l'abonnement (`NULL` = abonnement actif) |

---

### Table `artist`

Contient les profils des artistes qui publient de la musique sur la plateforme.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique de l'artiste |
| `name` | `varchar(255)` | NOT NULL | Nom de scène ou nom de l'artiste |
| `email` | `varchar(255)` | NOT NULL | Adresse email de l'artiste |
| `password` | `varchar(255)` | NOT NULL | Mot de passe du compte artiste (hashé) |
| `url_banner` | `varchar(255)` | NOT NULL | URL de la bannière ou image de profil de l'artiste |
| `certificate` | `longtext` | NOT NULL | Certificat ou justificatif associé à l'artiste |
| `created_at` | `datetime` | NOT NULL | Date et heure de création du compte artiste |

---

### Table `album`

Représente les albums publiés par les artistes.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique de l'album |
| `artist_id` | `int(11)` | NOT NULL, FK → `artist.id` | Référence à l'artiste auteur de l'album |
| `name` | `varchar(255)` | NOT NULL | Titre de l'album |
| `released_at` | `datetime` | NOT NULL | Date et heure de sortie de l'album |
| `finished_at` | `datetime` | NOT NULL | Date de fin de disponibilité ou de clôture de l'album |

---

### Table `song`

Contient les chansons disponibles sur la plateforme.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique de la chanson |
| `name` | `varchar(255)` | NOT NULL | Titre de la chanson |
| `duration` | `int(11)` | NOT NULL | Durée de la chanson en secondes |
| `is_explicit` | `tinyint(1)` | NOT NULL | Indique si le contenu est explicite (`1` = oui, `0` = non) |

---

### Table `album_song`

Table de jointure représentant la relation N:N entre les albums et les chansons.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `album_id` | `int(11)` | PK (composite), FK → `album.id` | Référence à l'album |
| `song_id` | `int(11)` | PK (composite), FK → `song.id` | Référence à la chanson |

---

### Table `playlist`

Playlists créées par les utilisateurs de la plateforme.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `id` | `int(11)` | PK, AUTO_INCREMENT, NOT NULL | Identifiant unique de la playlist |
| `account_id` | `int(11)` | NOT NULL, FK → `account.id` | Référence au compte créateur de la playlist |
| `name` | `varchar(255)` | NOT NULL | Nom de la playlist |
| `created_at` | `datetime` | NOT NULL | Date et heure de création de la playlist |
| `finished_at` | `datetime` | NOT NULL | Date et heure de suppression ou d'archivage de la playlist |

---

### Table `playlist_song`

Table de jointure représentant la relation N:N entre les playlists et les chansons.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `playlist_id` | `int(11)` | PK (composite), FK → `playlist.id` | Référence à la playlist |
| `song_id` | `int(11)` | PK (composite), FK → `song.id` | Référence à la chanson |

---

### Table `account_like_playlist`

Table de jointure représentant la relation N:N entre les comptes utilisateurs et les playlists qu'ils ont aimées.

| Colonne | Type | Contraintes | Description |
|---|---|---|---|
| `account_id` | `int(11)` | PK (composite), FK → `account.id` | Référence au compte utilisateur |
| `playlist_id` | `int(11)` | PK (composite), FK → `playlist.id` | Référence à la playlist aimée |


## 2. Requêtes

### 1. Afficher les 9 derniers album sortis, avec le nom de l’album, le nom de l’artiste et seulement son année de sortie

### 2. Afficher tous les artistes avec :
   - Le nom de leur album
   - L’année de sortie
   - On doit voir seulement les colonnes suivantes : « Nom artiste | Nom album | Année de sortie » et trié par nom d’artiste et année de sortie.

### 3. Afficher le nombre de playlist par compte

### 4. Afficher par album, la durée totale de celui-ci en seconde et son nombre de chansons, on doit voir : « Nom album | Durée totale | Nombre de chansons »
   Bonus : afficher la durée en hh :mm :ss

### 5. Afficher le(s) nom(s) de(s) artiste(s) les plus vieux, et seulement sur l’année. Par exemple, s’il y a 2 artistes en 1976 et que c’est l’année la plus basse, je veux voir les deux (on ignore le jours et le mois)

### 6. Afficher l’âge moyen des utilisateurs de l’application. Formule de calcul : année actuelle – année de « birth_date » de l’utilisateur

### 7. Afficher le nombre d’abonnés à la newsletter (colonne newsletter = 1 de la table account)
Afficher le nombre d’utilisateur par genre <br>
Bonus : labellisé les acronymes par leur signification : <br>
    - « F » = Femme <br>
    - « H » = Homme <br>
    - « NB » = Non-binaire <br>
    - « NR » = Non-renseigné

### 9. Afficher par abonnement (table « subscription »), le nombre de fois où un abonnement est présent sur l’année 2021

### 10. Afficher les utilisateurs n’ayant jamais créer de playlists

### 11. Afficher le nombre de like par playlist, avec le nom du propriétaire de la playlist, on doit voir :
    « Nom playlist | Nom propriétaire | Nombre de like »
    Il faut passer par la table « account_like_playlist »

### 12. Afficher le nombre de playlist par compte

### 13. Afficher la durée total des playlists publiques

### 14. Afficher l'âge de chaque utilisateur

### 15. Comptez le nombre d'utilisateur étant inscrit avec une adresse mail "gmail"

### 16. Afficher le nombre d'utilisateur inscrit depuis 2020

### 17. Afficher pour les abonnements **terminés** combien ont-ils rapportés à la plateforme (on affiche seulement les gains totaux pour tous les abonnements)