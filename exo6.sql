--- EXO 6

---1

SELECT a.name,
       art.name,
       YEAR(a.published_at)

FROM album a
    LEFT JOIN artist art
ON a.artist_id = art.id

ORDER BY a.published_at DESC LIMIT 9;

---2

SELECT art.name AS "Nom artiste",
       a.name   AS "Nom album", YEAR (a.published_at) AS "Année de sortie"
FROM artist art
    LEFT JOIN album a
ON a.artist_id = art.id
ORDER BY art.name, a.published_at;

---3

SELECT a.id,
       a.name,
       COUNT(p.id) AS "NB de playlist"

FROM account a

         LEFT JOIN playlist p ON p.account_id = a.id

GROUP BY a.id;

---4

SELECT al.name                      AS "Nom album",
       SUM(s.duration)              AS "Durée totale (s)",
       SEC_TO_TIME(SUM(s.duration)) AS "Durée (hh:mm:ss)",
       COUNT(s.id)                  AS "Nombre de chansons"
FROM album al
         JOIN album_song als ON als.album_id = al.id
         JOIN song s ON s.id = als.song_id
GROUP BY al.id, al.name;

---5

SELECT art.name AS "Nom artiste", YEAR (art.created_at) AS "Année"
FROM artist art
WHERE YEAR (art.created_at) = (
    SELECT MIN (YEAR (created_at))
    FROM artist
    );

---6

SELECT ROUND(AVG(YEAR (CURDATE()) - YEAR (birth_date))) AS "Âge moyen"
FROM account;

---7

SELECT COUNT(*) AS "Abonnés newsletter"
FROM account
WHERE newsletter = 1;

SELECT CASE gender
           WHEN 'H' THEN 'Homme'
           WHEN 'F' THEN 'Femme'
           WHEN 'NB' THEN 'Non-binaire'
           WHEN 'NR' THEN 'Non-renseigné'
           ELSE gender
           END  AS "Genre",
       COUNT(*) AS "Nombre d'utilisateurs"
FROM account
GROUP BY gender;


---9

SELECT s.name         AS "Abonnement",
       COUNT(*) AS "Nombre en 2021"
FROM subscription s
         LEFT JOIN account_subscription asub ON asub.subscription_id = s.id
WHERE YEAR(asub.effective_at) = 2021
GROUP BY s.id;

---10


SELECT a.id,
       a.name
FROM account a
WHERE a.id NOT IN (SELECT account_id
                   FROM playlist);

---11