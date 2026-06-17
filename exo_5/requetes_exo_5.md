```sql

CREATE
DATABASE IF NOT EXISTS `db_spotifish` CHARACTER SET utf8mb4;
USE
`db_spotifish`;

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`
(
    `id`         INT(8) NOT NULL AUTO_INCREMENT,
    `name`       VARCHAR(80)  NOT NULL,
    `email`      VARCHAR(120) NOT NULL,
    `password`   VARCHAR(255) NOT NULL,
    `birth_date` DATE         NOT NULL,
    `gender`     ENUM('H','F','NB','A','NR') NOT NULL,
    `newsletter` TINYINT(1) DEFAULT 0,
    `created_at` DATETIME     NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `subscription`;

CREATE TABLE `subscription`
(
    `id`   INT(8) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `cost` FLOAT        NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `artist`;

CREATE TABLE `artist`
(
    `id`          INT(8) NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(80)  NOT NULL,
    `email`       VARCHAR(120) NOT NULL,
    `password`    VARCHAR(255) NOT NULL,
    `banner_url`  VARCHAR(255),
    `certificate` TEXT,
    `created_at`  DATETIME     NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `song`;

CREATE TABLE `song`
(
    `id`       INT(8) NOT NULL AUTO_INCREMENT,
    `name`     VARCHAR(255) NOT NULL,
    `duration` INT(6) NOT NULL,
    `explicit` TINYINT(1) DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `account_subscription`;

CREATE TABLE `account_subscription`
(
    `id`              INT(8) NOT NULL AUTO_INCREMENT,
    `account_id`      INT(8) NOT NULL,
    `subscription_id` INT(8) NOT NULL,
    `effective_at`    DATETIME NOT NULL,
    `finished_at`     DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
    FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `playlist`;

CREATE TABLE `playlist`
(
    `id`         INT(8) NOT NULL AUTO_INCREMENT,
    `account_id` INT(8) NOT NULL,
    `name`       VARCHAR(80) NOT NULL,
    `created_at` DATETIME    NOT NULL,
    `updated_at` DATETIME    NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album`
(
    `id`           INT(8) NOT NULL AUTO_INCREMENT,
    `artist_id`    INT(8) NOT NULL,
    `name`         VARCHAR(255) NOT NULL,
    `published_at` DATE,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `playlist_song`;

CREATE TABLE `playlist_song`
(
    `id`          INT(8) NOT NULL AUTO_INCREMENT,
    `playlist_id` INT(8) NOT NULL,
    `song_id`     INT(8) NOT NULL,
    `position`    INT(10) NOT NULL,
    `add_at`      DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`),
    FOREIGN KEY (`song_id`) REFERENCES `song` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `album_song`;

CREATE TABLE `album_song`
(
    `album_id` INT(8) NOT NULL,
    `song_id`  INT(8) NOT NULL,
    PRIMARY KEY (`album_id`, `song_id`),
    FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
    FOREIGN KEY (`song_id`) REFERENCES `song` (`id`)
) ENGINE=InnoDB;
```

