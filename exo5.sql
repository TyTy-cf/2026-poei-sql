DROP DATABASE IF EXISTS spotifish;
CREATE DATABASE IF NOT EXISTS spotifish DEFAULT CHARACTER SET utf8;
USE spotifish;

DROP TABLE IF EXISTS account;
CREATE TABLE IF NOT EXISTS account
(
    id         INT(8) NOT NULL AUTO_INCREMENT,
    name       VARCHAR(80)  NOT NULL,
    email      VARCHAR(120) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    birth_date DATE         NOT NULL,
    gender     ENUM('H', 'F', 'NB', 'A', 'NR'),
    newsletter TINYINT      NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (id)
    );

DROP TABLE IF EXISTS subscription;
CREATE TABLE IF NOT EXISTS subscription
(
    id   INT(8) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    cost FLOAT        NOT NULL,
    PRIMARY KEY (id)
    );

DROP TABLE IF EXISTS account_sub;
CREATE TABLE IF NOT EXISTS account_sub
(
    id              INT(8) NOT NULL AUTO_INCREMENT,
    account_id      INT(8) NOT NULL,
    subscription_id INT(8) NOT NULL,
    effective_at    DATETIME NOT NULL,
    finished_at     DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account (id),
    FOREIGN KEY (subscription_id) REFERENCES subscription (id)
    );

DROP TABLE IF EXISTS playlist;
CREATE TABLE IF NOT EXISTS playlist
(
    id         INT(8) NOT NULL AUTO_INCREMENT,
    account_id INT(0) NOT NULL,
    name       VARCHAR(80) NOT NULL,
    created_at DATETIME    NOT NULL,
    updated_at DATETIME    NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account (id)
    );

DROP TABLE IF EXISTS song;
CREATE TABLE IF NOT EXISTS song
(
    id INT(8) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    duration INT(6),
    explicit TINYINT NOT NULL,
    PRIMARY KEY (id)
    );

DROP TABLE IF EXISTS playlist_song;
CREATE TABLE IF NOT EXISTS playlist_song (
    id INT(8) NOT NULL AUTO_INCREMENT,
    playlist_id INT(8) NOT NULL,
    song_id INT(8) NOT NULL,
    position INT(10) NOT NULL,
    add_at DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (playlist_id) REFERENCES playlist(id),
    FOREIGN KEY (song_id) REFERENCES song(id)
    );

DROP TABLE IF EXISTS artist;
CREATE TABLE IF NOT EXISTS artist (
    id INT(8) NOT NULL AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    email VARCHAR(120) NOT NULL,
    password VARCHAR(255) NOT NULL,
    banner_url VARCHAR(255) NOT NULL,
    certificate TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (id)
    );

DROP TABLE IF EXISTS album;
CREATE TABLE IF NOT EXISTS album (
    id INT(8) NOT NULL AUTO_INCREMENT,
    artist_id INT(8) NOT NULL,
    name VARCHAR(255) NOT NULL,
    published_at DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (artist_id) REFERENCES artist(id)
    );

DROP TABLE IF EXISTS album_song;
CREATE TABLE IF NOT EXISTS album_song (
    album_id INT(8) NOT NULL,
    song_id  INT(8) NOT NULL,
    PRIMARY KEY (album_id, song_id),
    FOREIGN KEY (album_id) REFERENCES album(id),
    FOREIGN KEY (song_id) REFERENCES song(id)
    )