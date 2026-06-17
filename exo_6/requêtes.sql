-- 6-1

SELECT album.name, artist.name, album.published_at
FROM album
         JOIN artist ON album.artist_id = artist.id
ORDER BY album.published_at DESC
LIMIT 9;

-- 6-2

SELECT artist.name "Nom artiste", album.name "Nom album", YEAR(album.published_at) "Année de sortie"
FROM artist
         JOIN album ON artist.id = album.artist_id
ORDER BY YEAR(album.published_at), artist.name;

-- 6-3

SELECT COUNT(playlist.id), account.name, GROUP_CONCAT(playlist.name, " | ")
FROM playlist
         JOIN account ON playlist.account_id = account.id
GROUP BY playlist.account_id;

-- 6-4

SELECT album.name                                                "Nom album",
       CONCAT(LPAD(FLOOR(SUM(song.duration) / 3600), 2, 0), ":", LPAD(FLOOR((SUM(song.duration) % 3600) / 60), 2, 0),
              ":", LPAD((SUM(song.duration) % 3600) % 60, 2, 0)) "Durée Totale",
       COUNT(album_song.album_id)                                "Nombre de chansons"
FROM album
         JOIN album_song ON album.id = album_song.album_id
         JOIN song ON album_song.song_id = song.id
GROUP BY album_song.album_id;

-- 6-5

SELECT GROUP_CONCAT(name), YEAR(created_at)
FROM artist
GROUP BY YEAR(created_at)
ORDER BY created_at
LIMIT 1;

-- 6-6

SELECT AVG(YEAR(NOW()) - YEAR(account.birth_date)) "Moyenne d'age comptes"
FROM account;

-- 6-7

SELECT SUM(newsletter) sum_newsletter,
       (CASE
            WHEN gender = 'F' THEN 'Femme'
            WHEN gender = 'H' THEN 'Homme'
            WHEN gender = 'NB' THEN 'Non-binaire'
            WHEN gender = 'NR' THEN 'Non-renseigné'
           END
           )           gender
FROM account
GROUP BY gender;

-- 6-9 Nice

SELECT COUNT(*)
FROM account_subscription
WHERE YEAR(effective_at) <= 2021
  AND YEAR(finished_at) >= 2021;

-- 6-10

SELECT account.name
FROM account
         LEFT JOIN playlist ON account.id = playlist.account_id
WHERE playlist.account_id IS NULL;

-- 6-11

SELECT playlist.name "Nom playlist", account.name "Nom propriétaire", COUNT(alp.playlist_id) "Nombre de like"
FROM playlist
         JOIN account ON playlist.account_id = account.id
         LEFT JOIN account_like_playlist AS alp ON alp.playlist_id = playlist.id
GROUP BY alp.playlist_id;

-- 6-12

SELECT account.name, COUNT(playlist.id) nb_playlists
FROM account
         LEFT JOIN playlist ON account.id = playlist.account_id
GROUP BY playlist.account_id, account.id;

-- 6-13

SELECT CONCAT(LPAD(FLOOR(SUM(song.duration) / 3600), 2, 0), ":", LPAD(FLOOR((SUM(song.duration) % 3600) / 60), 2, 0),
              ":", LPAD((SUM(song.duration) % 3600) % 60, 2, 0)) "Durée Totale des playlists"
FROM playlist
         JOIN playlist_song ON playlist.id = playlist_song.playlist_id
         JOIN song ON playlist_song.song_id = song.id

-- 6-14

SELECT name, (YEAR(NOW()) - YEAR(account.birth_date)) "Age"
FROM account;

-- 6-15

SELECT COUNT(*)
FROM account
WHERE email LIKE "%@gmail.%";

-- 6-16

SELECT name
FROM account
WHERE YEAR(created_at) >= 2020;

-- 6-17

SELECT SUM(subscription.cost * PERIOD_DIFF(DATE_FORMAT(account_subscription.finished_at, "%Y%m"), DATE_FORMAT(account_subscription.effective_at, "%Y%m"))) "Somme des revenus sub terminés"
FROM account_subscription
         JOIN subscription ON account_subscription.subscription_id = subscription.id
WHERE subscription_id > 1 AND finished_at IS NOT NULL