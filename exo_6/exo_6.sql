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

SELECT
    a.name,
    COUNT(p.id) AS total_playlists
FROM account AS a
         LEFT JOIN playlist AS p
                   ON p.account_id = a.id
GROUP BY a.id;

-- 4. Afficher par album, la durée totale de celui-ci en seconde et son nombre de chansons, on doit voir : « Nom album | Durée totale | Nombre de chansons »

SELECT
    alb.name,
    SEC_TO_TIME(SUM(s.duration))as "Durée totale", -- sympas celui la :)
    COUNT(s.id) as "Nombre de chansons"

FROM album alb
         JOIN album_song alb_song
              ON alb_song.album_id = alb.id
         JOIN song s
              ON s.id= alb_song.song_id
GROUP BY alb.id

-- 5. Afficher le(s) nom(s) de(s) artiste(s) les plus vieux, et seulement sur l’année. Par exemple, s’il y a 2 artistes en 1976 et que c’est l’année la plus basse, je veux voir les deux (on ignore le jours et le mois)

SELECT
    a.name,
    alb.name AS album_name,
    YEAR(alb.published_at) AS release_year
FROM artist AS a
    JOIN album AS alb
ON alb.artist_id = a.id
WHERE YEAR(alb.published_at) = (
    SELECT MIN(YEAR(published_at))
    FROM album
    );
