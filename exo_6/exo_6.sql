SELECT a.name,
       artist.name, YEAR (a.published_at) AS Year

FROM album a
    JOIN artist artist
ON artist.id = a.artist_id
ORDER BY a.published_at DESC
    LIMIT 9;

-- 2) ---------------
SELECT a.name,
       alb.name, YEAR (alb.published_at) AS YEAR
FROM artist a
    JOIN album alb
ON alb.artist_id = a.id

ORDER BY a.name

-- 3. Afficher le nombre de playlist par compte--

SELECT a.name,
       COUNT(p.id) AS total_playlists
FROM account AS a
         LEFT JOIN playlist AS p
                   ON p.account_id = a.id
GROUP BY a.id;

-- 4. Afficher par album, la durée totale de celui-ci en seconde et son nombre de chansons, on doit voir : « Nom album | Durée totale | Nombre de chansons »

SELECT alb.name,
       SEC_TO_TIME(SUM(s.duration)) as "Durée totale", -- sympas celui la :)
       COUNT(s.id)                  as "Nombre de chansons"

FROM album alb
         JOIN album_song alb_song
              ON alb_song.album_id = alb.id
         JOIN song s
              ON s.id = alb_song.song_id
GROUP BY alb.id

-- 5. Afficher le(s) nom(s) de(s) artiste(s) les plus vieux, et seulement sur l’année. Par exemple, s’il y a 2 artistes en 1976 et que c’est l’année la plus basse, je veux voir les deux (on ignore le jours et le mois)

SELECT a.name,
       alb.name AS album_name, YEAR (alb.published_at) AS release_year
FROM artist AS a
    JOIN album AS alb
ON alb.artist_id = a.id
WHERE YEAR (alb.published_at) = (
    SELECT MIN (YEAR (published_at))
    FROM album
    );

-- 6. Afficher l’âge moyen des utilisateurs de l’application. Formule de calcul : année actuelle – année de « birth_date » de l’utilisateur
SELECT FORMAT(
               AVG(
                       YEAR (NOW()) - YEAR ( acc.birth_date)
        )
           , 2) as "age moyen"

FROM account acc;

/*-- 7. Afficher le nombre d’abonnés à la newsletter (colonne newsletter = 1 de la table account)
-- Afficher le nombre d’utilisateur par genre
-- Bonus : labellisé les acronymes par leur signification :
- « F » = Femme
- « H » = Homme
- « NB » = Non-binaire
- « NR » = Non-renseigné
*/

SELECT COUNT(a.id) AS 'abonnés newslette', CASE a.gender
                                               WHEN 'F' THEN 'Femme'
                                               WHEN 'H' THEN 'Homme'
                                               WHEN 'NB' THEN 'Non-binaire'
                                               WHEN 'NR' THEN 'Non-renseigné'
    END AS gender_label


FROM account a
WHERE newsletter = 1
GROUP BY gender;

/*9. Afficher par abonnement (table « subscription »), le nombre de fois où un abonnement est présent sur l’année 2021
*/

SELECT sb.name,
       COUNT(sb.id) as "Nombre de subscription"

FROM subscription sb
         LEFT JOIN account_subscription a_s
                   ON a_s.subscription_id = sb.id

WHERE YEAR (a_s.effective_at) <= 2021
  AND YEAR (a_s.finished_at) >= 2021

GROUP BY sb.id

/*10. Afficher les utilisateurs n’ayant jamais créer de playlists, je sais que je peux faire plus simple mais je voulais use Having*/


SELECT a.name,
       COUNT(p.id) AS "nombre de playlist"

FROM account a
         LEFT JOIN playlist p
                   ON p.account_id = a.id
GROUP by a.id

HAVING (COUNT(p.id) = 0);

