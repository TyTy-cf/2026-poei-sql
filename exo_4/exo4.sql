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

ORDER BY published_at DESC;



SELECT SUM(library.game_time),
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



SELECT publisher.id,
       publisher.name,
       SUM(game.price) AS totalEarned
FROM library
         JOIN game ON library.game_id = game.id
         JOIN publisher ON game.publisher_id = publisher.id
GROUP BY publisher.id;



SELECT genre.id,
       genre.name,
       COUNT(*)

FROM library

JOIN game ON library.game_id = game.id
JOIN game_genre ON game.id = game_genre.game_id
JOIN genre ON game_genre.genre_id = genre.id

GROUP BY genre.id;



SELECT game.id,
       game.name,
       COUNT(*) AS nbVentes
FROM library
         JOIN game ON library.game_id = game.id
         JOIN publisher ON game.publisher_id = publisher.id
GROUP BY game.id
ORDER BY COUNT(*)
LIMIT 3;


SELECT game.id,
       game.name,
       SUM(game_time)
FROM library
         JOIN game ON library.game_id = game.id
         JOIN publisher ON game.publisher_id = publisher.id
GROUP BY game.id
ORDER BY COUNT(*)
LIMIT 3;



SELECT name,
       YEAR(published_at)

FROM game
ORDER BY published_at;



SELECT name,
       published_at
FROM game
WHERE published_at = (SELECT MIN(published_at)
                      FROM game);



SELECT game.name,
    ROUND(AVG(comment.rank), 2)
    FROM game
JOIN comment ON game.id = comment.game_id
GROUP BY game.name;



SELECT game.name,
    COUNT(comment.down_votes)
FROM game
    JOIN comment ON game.id = comment.game_id
    GROUP BY game.name
    ORDER BY comment.down_votes
    LIMIT 1;


SELECT game.name,
    comment.rank
FROM game
JOIN comment ON game.id = comment.game_id
WHERE comment.rank > (SELECT AVG(rank)
                   FROM comment)
GROUP BY game.name;


SELECT account.name,
       COUNT(*)
FROM account
JOIN library ON account.id = library.account_id
WHERE library.game_id = NULL
GROUP BY account.name;


