1
SELECT album.name,
       artist.name,
    YEAR(album.published_at)

FROM album
JOIN artist ON album.artist_id = artist.id
ORDER BY album.published_at DESC
    LIMIT 9;



2
SELECT artist.name,
       album.name,
       YEAR(album.published_at)
FROM album
JOIN artist ON album.artist_id = artist.id
ORDER BY artist.name, album.published_at;



3
SELECT account.id,
       account.name,
       COUNT(*) AS nbPlaylist
FROM playlist
         LEFT JOIN account ON playlist.account_id = account.id
GROUP BY account.id
ORDER BY nbPlaylist;



4
SELECT album.name,
       SEC_TO_TIME(SUM(song.duration)) AS duréeAlbum,
       COUNT(*) AS nbChansons
FROM album
         LEFT JOIN album_song ON album.id = album_song.album_id
         LEFT JOIN song ON album_song.song_id = song.id
GROUP BY album.name;



5
SELECT name,
       YEAR(created_at)
FROM artist
WHERE YEAR(created_at) = (
    SELECT MIN(YEAR(created_at))
    FROM artist
    )
ORDER BY YEAR(created_at);



6
SELECT AVG(YEAR(NOW()) - YEAR(birth_date)) AS averageAgeUser
FROM account;



7
SELECT CASE gender
           WHEN "H" THEN "Homme"
           WHEN "F" THEN "Femme"
           WHEN "NB" THEN "Non Binary"
           WHEN "NR" THEN "Non Renseigné"
           END AS gender,
       SUM(newsletter)
FROM account
GROUP BY gender;



8
est parti acheter du lait



9
SELECT subscription.name,
       COUNT(*)
FROM subscription
         LEFT JOIN account_subscription ON subscription.id = account_subscription.subscription_id
WHERE (YEAR(account_subscription.effective_at) >= 2021
          AND (YEAR(account_subscription.finished_at) <= 2021 OR
          account_subscription.finished_at IS NULL))
GROUP BY subscription.name;





10
SELECT account.id,
       account.name
FROM account
LEFT JOIN playlist ON account.id = playlist.account_id
WHERE playlist.account_id IS NULL;



11
SELECT playlist.name,
       account.name,
       playlist.account_id,
       COUNT(*)
FROM playlist
         LEFT JOIN account_like_playlist ON playlist.id = account_like_playlist.playlist_id
         JOIN account ON playlist.account_id = account.id
GROUP BY playlist.name;



12
SELECT account.id,
       account.name,
       COUNT(*) AS nbPlaylists
FROM account

LEFT JOIN playlist ON account.id = playlist.account_id
GROUP BY account.id;



13
SELECT playlist.id,
       playlist.name,
       SUM(song.duration) AS duréePlaylist
FROM playlist
JOIN playlist_song ON playlist.id = playlist_song.playlist_id
JOIN song ON playlist_song.song_id = song.id
GROUP BY playlist.id, playlist.name;



14
SELECT id,
    name,
    YEAR(NOW()) - YEAR(birth_date) AS ageUser
FROM account;



15
SELECT COUNT(*)
FROM account
WHERE email LIKE "%gmail%";



16
SELECT COUNT(*)
FROM account
WHERE created_at LIKE "2020%";



17
SELECT ROUND(SUM(cost), 2) AS gainToto
FROM account_subscription
LEFT JOIN subscription ON account_subscription.subscription_id = subscription.id
WHERE account_subscription.finished_at IS NOT NULL;