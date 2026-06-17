

CREATE DATABASE `db_spotifish`;

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
    `id` int(8) NOT NULL AUTO_INCREMENT,
    `name` varchar(80) NOT NULL,
    `email` varchar(120) NOT NULL,
    `password` varchar(255) NOT NULL,
    `birth_date` date DEFAULT NULL, 
    `gender` ENUM('H', 'F', 'NB', 'A', 'NR') NOT NULL,
    `newsletter` tinyint(1) DEFAULT NULL,
    `created_at` datetime NOT NULL,
    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `playlist`;
CREATE TABLE IF NOT EXISTS `playlist` (
    `id` int(8) NOT NULL AUTO_INCREMENT,
    `account_id` int(8) NOT NULL,
    `name` varchar(80) NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`account_id`) REFERENCES `account`(`id`) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE IF NOT EXISTS `subscription` (
    `id` int(8) NOT NULL AUTO_INCREMENT,
    `name` varchar(80) NOT NULL,
    `cost` float NOT NULL,
    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `account_subscription`;
CREATE TABLE IF NOT EXISTS `account_subscription` (
    `id` int(8) NOT NULL AUTO_INCREMENT,
    `account_id` int(8) NOT NULL,
    `subscription_id` int(8) NOT NULL,
    `effective_at` datetime NOT NULL,
    `finished_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`account_id`) REFERENCES `account`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`subscription_id`) REFERENCES `subscription`(`id`) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `song`;
CREATE TABLE IF NOT EXISTS `song` (
    `id` int(8) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `duration` int(6) NOT NULL,
    `explicit` tinyint(1) NOT NULL,
    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `playlist_song`;
CREATE TABLE IF NOT EXISTS `playlist_song` (
    `id` int(8) NOT NULL AUTO_INCREMENT,
    `playlist_id` int(8) NOT NULL,
    `song_id` int(8) NOT NULL,
    `position` int(10) NOT NULL,
    `add_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`playlist_id`) REFERENCES `playlist`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`song_id`) REFERENCES `song`(`id`) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `artist`;
CREATE TABLE IF NOT EXISTS `artist` (
    `id` int(8) NOT NULL AUTO_INCREMENT,
    `name` varchar(80) NOT NULL,
    `email` varchar(120) NOT NULL,
    `password` varchar(255) NOT NULL,
    `banner_url` varchar(255) NOT NULL,
    `certificate` text NOT NULL,
    `created_at` datetime NOT NULL,
     PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
    `id` int(8) NOT NULL AUTO_INCREMENT,
    `artist_id` int(8) NOT NULL,
    `name` varchar(255) NOT NULL,
    `published_at` date DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`artist_id`) REFERENCES `artist`(`id`) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `album_song`;
CREATE TABLE IF NOT EXISTS `album_song` (
    `artist_id` int(8) NOT NULL,
    `song_id` int(8) NOT NULL,
    FOREIGN KEY (`artist_id`) REFERENCES `artist`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`song_id`) REFERENCES `song`(`id`) ON DELETE CASCADE
);

USE `db_spotifish`;