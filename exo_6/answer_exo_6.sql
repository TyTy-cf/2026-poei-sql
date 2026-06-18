-- 1. Afficher les 9 derniers album sortis, avec le nom de l’album, le nom de l’artiste et seulement son année de sortie
SELECT 
    album.name,
    album.published_at,
    artist.name
FROM album 
JOIN artist ON album.artist_id = artist.id
ORDER BY album.published_at DESC
LIMIT 9;

-- 2. Afficher tous les artistes avec :
   -- Le nom de leur album
   -- L'année de sortie
   -- On doit voir seulement les colonnes suivantes : « Nom artiste | Nom album | Année de sortie » et trié par nom d’artiste et année de sortie.
SELECT
    album.name as "Nom artiste",
    artist.name as  "Nom album",
    EXTRACT(YEAR FROM album.published_at) as "Année de sortie"
FROM 
    album 
JOIN artist ON album.artist_id = artist.id
ORDER BY artist.name, album.published_at



-- 3. Afficher le nombre de playlist par compte
SELECT
    a.name AS account_name,
    COUNT(p.id) AS playlist_count
FROM playlist p
JOIN account a ON p.account_id = a.id
GROUP BY a.id
ORDER BY playlist_count DESC



-- 4. Afficher par album, la durée totale de celui-ci en seconde et son nombre de chansons, on doit voir : « Nom album | Durée totale | Nombre de chansons »
   -- Bonus : afficher la durée en hh :mm :ss
SELECT
    a.name as "Nom album",
    SEC_TO_TIME(SUM(s.duration)) as "Durée totale",
    COUNT(s.id) as "Nombre de chansons"
FROM album a
JOIN album_song al ON a.id = al.album_id
JOIN song s ON al.song_id = s.id
GROUP BY a.id, a.name
ORDER BY SEC_TO_TIME(SUM(s.duration)) DESC

-- 5. Afficher le(s) nom(s) de(s) artiste(s) les plus vieux, et seulement sur l’année. 
-- Par exemple, s’il y a 2 artistes en 1976 et que c’est l’année la plus basse, je veux voir les deux (on ignore le jours et le mois)
SELECT 
    a.name,
    MIN(EXTRACT(YEAR FROM a.created_at)) as year
FROM artist a
WHERE EXTRACT(YEAR FROM a.created_at) = (select MIN(EXTRACT(YEAR FROM a.created_at)) FROM artist)

-- 6. Afficher l’âge moyen des utilisateurs de l’application. Formule de calcul : année actuelle – année de « birth_date » de l’utilisateur
SELECT 
    AVG(EXTRACT(YEAR FROM CURDATE()) - EXTRACT(YEAR FROM a.birth_date)) AS average_age
FROM account a

-- 7. Afficher le nombre d’abonnés à la newsletter (colonne newsletter = 1 de la table account)
-- Afficher le nombre d’utilisateur par genre
-- Bonus : labellisé les acronymes par leur signification :
    -- « F » = Femme
    -- « H » = Homme
    -- « NB » = Non-binaire
    -- « NR » = Non-renseigné
SELECT 
    SUM(newsletter) as "Nombre d'abonnés",
    sum(case when gender = 'F' then 1 else 0 end) as "Femme",
    sum(case when gender = 'H' then 1 else 0 end) as "Homme", 
    sum(case when gender = 'NB' then 1 else 0 end) as "Non-binaire",
    sum(case when gender = 'NR' then 1 else 0 end) as "Non-renseigné"
FROM account
GROUP BY newsletter 

-- 9. Afficher par abonnement (table « subscription »), le nombre de fois où un abonnement est présent sur l’année 2021
SELECT 
    s.name AS subscription_name,
    COUNT(*) AS subscription_count
FROM account_subscription as asub
JOIN subscription s ON asub.subscription_id = s.id
WHERE YEAR(asub.effective_at) = 2021
OR YEAR(asub.finished_at) > 2021 AND YEAR(asub.effective_at) < 2021
GROUP BY s.name


-- 10. Afficher les utilisateurs n’ayant jamais créer de playlists
SELECT 
    a.name AS user,
    COUNT(p.id) AS playlist_count
FROM account a
LEFT JOIN playlist p ON p.account_id = a.id
WHERE p.id IS NULL

-- 11. Afficher le nombre de like par playlist, avec le nom du propriétaire de la playlist, on doit voir :
    -- « Nom playlist | Nom propriétaire | Nombre de like »
    -- Il faut passer par la table « account_like_playlist »
SELECT 
    p.name AS " Nom playlist",
    a.name AS " Nom propriétaire",
    count(alp.account_id) AS " Nombre de like"
FROM playlist p
JOIN account a ON p.account_id = a.id
LEFT JOIN account_like_playlist alp ON p.id = alp.playlist_id
GROUP BY p.id, a.name

-- 12. Afficher le nombre de playlist par compte
SELECT
    a.name AS "Nom du compte",
    COUNT(p.id) AS "Nombre de playlist"
FROM playlist p
JOIN account a ON p.account_id = a.id
GROUP BY a.id, a.name

-- 13. Afficher la durée total des playlists publiques
SELECT 
    p.name AS " Nom playlist",
    SUM(s.duration) AS "Durée totale" 
FROM playlist p
JOIN playlist_song ps ON p.id = ps.playlist_id
JOIN song s ON ps.song_id = s.id
group BY p.id, p.name

-- 14. Afficher l'âge de chaque utilisateur
SELECT 
    a.name AS "Nom utilisateur",
    EXTRACT(YEAR FROM CURDATE()) - EXTRACT(YEAR FROM a.birth_date) AS "Âge"
FROM account a

-- 15. Comptez le nombre d'utilisateur étant inscrit avec une adresse mail "gmail"
SELECT 
    COUNT(*) AS "Nombre d'utilisateurs avec un mail gmail"
FROM account a   
WHERE a.email LIKE '%@gmail.com'

-- 16. Afficher le nombre d'utilisateur inscrit depuis 2020
SELECT 
    COUNT(*) AS "Nombre d'utilisateurs inscrits depuis 2020"
FROM account a
WHERE a.created_at >= '2020-01-01'