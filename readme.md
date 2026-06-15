
# SQL

Pensez à conserver vos requêtes SQL dans un fichier à part !!!


## 1. Création Base de données & table


### 1.1 

- Créer une base de données de nom "tp"

### 1.2

- Créer une table de nom "student"
- Elle doit avoir les colonnes suivantes :
	- id : entier sur 6, clé primaire, non null et auto incrémenté
	- name : string sur 64 caractères, non null
	- birthAt : date, nullable

### 1.3

- Modifier la table "student"
- Ajouter lui une colonne "height", un entier sur 3, nullable
	
### 1.4

- Modifier la table "student"
- Ajouter une colonne "gender", un ENUM qui prend les valeurs H, F ou A, placez la colonne après "name"

### 1.5

- Modifier la table "student"
- Supprimer la colonne "name"

### 1.6

- Créer une table "course"
- Elle représente une table des matières à enseigner
- Créez la table avec les colonnes et leur type, que vous jugerez adéquat
(Aide : j'en vois au moins 4)
