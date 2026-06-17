SELECT name,
       published_at
FROM game
ORDER BY published_at;



SELECT name,
       price
FROM game
WHERE price=(SELECT MAX(price)
    FROM game
    );



SELECT game.name,
       game.published_at
FROM game

JOIN game_genre ON game.id = game_genre.game_id
JOIN genre ON game_genre.genre_id = genre.id

WHERE genre.name = "FPS"

ORDER BY published_at;



SELECT library.game_time,
       account.name
FROM    account

JOIN library ON account.id = library.account_id
JOIN game ON library.game_id = game.id



SELECT CONCAT(SUM(library.installed), " / ",
       COUNT(library.installed)) AS gameIsInstalled,
       account.name,
       account.id

FROM account

         JOIN library ON account.id = library.account_id
         JOIN game ON library.game_id = game.id

GROUP BY account.id;



SELECT SUM(game.price) AS totalSpentOnSteamish,
    account.name,
    account.id

FROM account

    JOIN library ON account.id = library.account_id
    JOIN game ON library.game_id = game.id

GROUP BY account.id;



SELECT nickname,
       COUNT(*)

FROM account

GROUP BY nickname
HAVING(COUNT(*) > 1);



SELECT game.id,
       game.name,
       COUNT(*)
FROM library
         JOIN game ON library.game_id = game.id
GROUP BY game.id;



SELECT publisher.id,
       publisher.name,
       COUNT(*) * game.price AS totalEarned
FROM library
         JOIN game ON library.game_id = game.id
JOIN publisher ON game.publisher_id = publisher.id
GROUP BY publisher.id;



SELECT