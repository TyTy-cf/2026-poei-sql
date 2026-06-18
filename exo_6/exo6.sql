### 1. Afficher les 9 derniers album sortis, avec le nom de l’album, le nom de l’artiste et seulement son année de sortie

SELECT al.name,ar.name,YEAR(al.published_at)
FROM  artist ar
JOIN album al  ON ar.id = al.artist_id
ORDER BY published_at DESC
limit 9;

### 2. Afficher tous les artistes avec :
   - Le nom de leur album
   - L’année de sortie
   - On doit voir seulement les colonnes suivantes : « Nom artiste | Nom album | Année de sortie » et trié par nom d’artiste et année de sortie.

SELECT ar.name as Nom_artiste,al.name Nom_album ,YEAR(al.published_at) as Année_sortie
FROM  artist ar 
JOIN album al ON ar.id = al.artist_id
ORDER BY ar.name,YEAR(al.published_at);


### 3. Afficher le nombre de playlist par compte

SELECT  acc.name as Nom_artist,pl.name as Nom_album, COUNT(acc.id) as Number_play
FROM account acc
LEFT JOIN playlist pl ON acc.id = pl.account_id
GROUP BY acc.name;


### 4. Afficher par album, la durée totale de celui-ci en seconde et son nombre de chansons, on doit voir : « Nom album | Durée totale | Nombre de chansons »
   Bonus : afficher la durée en hh :mm :ss

SELECT  al.name AS Nom_album, SEC_TO_TIME(SUM(s.duration)) AS Total_duree, COUNT(s.id)  AS Nombre_chansons
FROM album al
JOIN album_song al_s on al.id = al_s.album_id
JOIN song s ON s.id = al_s.song_id
GROUP BY al.name;



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