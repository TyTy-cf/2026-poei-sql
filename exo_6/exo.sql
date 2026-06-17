-- 1

SELECT 
    album.name, 
    artist.name, 
    DATE_FORMAT(album.published_at, "%Y") AS published_year
FROM album
JOIN artist ON artist.id = album.artist_id
ORDER BY album.published_at DESC
LIMIT 9;

-- 2

SELECT 
    artist.name AS "Nom artiste",
    album.name AS "Nom album",
    DATE_FORMAT(album.published_at, "%Y") AS "Année de sortie"
FROM artist
JOIN album ON album.artist_id = artist.id
ORDER BY artist.name, DATE_FORMAT(album.published_at, "%Y");

-- 3

SELECT 
    a.name, 
    COUNT(p.account_id) AS playlist_length
FROM account AS a
JOIN playlist AS p ON p.account_id = a.id
GROUP BY a.id;

-- 4

SELECT
    a.name AS "Nom album",
    SUM(s.duration) AS "Durée totale",
    COUNT(as.song_id) AS "Nombre de chansons"
FROM album_song AS `as`
JOIN album AS a ON a.id = `as`.album_id
JOIN song AS s ON s.id = `as`.song_id
GROUP BY a.name;