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
Ya pô



9
