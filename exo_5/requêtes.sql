CREATE DATABASE db_spotifish DEFAULT CHARACTER SET utf8;

USE `db_spotifish`;

CREATE TABLE account
(
    id         INT(8) AUTO_INCREMENT UNIQUE,
    name       VARCHAR(120)                     DEFAULT NULL,
    email      VARCHAR(120) NOT NULL,
    password   VARCHAR(255) NOT NULL,
    birth_date DATE                             DEFAULT NULL,
    gender     ENUM ('H', 'F', 'NB', 'A', 'NR') DEFAULT 'NR',
    newsletter TINYINT(1)                       DEFAULT 0,
    created_at DATETIME                         DEFAULT NOW(),
    PRIMARY KEY (id)
);

CREATE TABLE subscription
(
    id   INT(8) AUTO_INCREMENT UNIQUE,
    name VARCHAR(255) NOT NULL,
    cost FLOAT        NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE account_subscription
(
    id              INT(8) AUTO_INCREMENT UNIQUE,
    account_id      INT(8) NOT NULL,
    CONSTRAINT fk_account
        FOREIGN KEY (account_id)
            REFERENCES account (id),
    subscription_id INT(8) NOT NULL,
    CONSTRAINT fk_subscription
        FOREIGN KEY (subscription_id)
            REFERENCES subscription (id),
    effective_at    DATETIME DEFAULT NULL,
    finished_at     DATETIME DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE artist
(
    id          INT(8) AUTO_INCREMENT UNIQUE,
    name        VARCHAR(120) DEFAULT NULL,
    email       VARCHAR(120) NOT NULL,
    password    VARCHAR(255) NOT NULL,
    banner_url  VARCHAR(255) DEFAULT NULL,
    certificate TEXT,
    created_at  DATETIME     DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE song
(
    id       INT(8) AUTO_INCREMENT UNIQUE,
    name     VARCHAR(120) DEFAULT NULL,
    duration INT(6) NOT NULL,
    explicit TINYINT(1)   DEFAULT 0,
    PRIMARY KEY (id)
);

CREATE TABLE album
(
    id           INT(8) AUTO_INCREMENT UNIQUE,
    artist_id    INT(8) NOT NULL,
    CONSTRAINT fk_artist
        FOREIGN KEY (artist_id)
            REFERENCES artist (id),
    name         VARCHAR(120) DEFAULT NULL,
    published_at DATE         DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE album_song
(
    album_id INT(8),
    CONSTRAINT fk_album
        FOREIGN KEY (album_id)
            REFERENCES album (id),
    song_id  INT(8),
    CONSTRAINT fk_song
        FOREIGN KEY (song_id)
            REFERENCES song (id)
);

CREATE TABLE playlist
(
    id         INT(8) AUTO_INCREMENT UNIQUE,
    account_id INT(8) NOT NULL,
    CONSTRAINT fk_account_playlist
        FOREIGN KEY (account_id)
            REFERENCES account (id),
    name       VARCHAR(120) DEFAULT NULL,
    created_at DATETIME     DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME     DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE playlist_song
(
    id          INT(8) AUTO_INCREMENT UNIQUE,
    playlist_id INT(8)  NOT NULL,
    CONSTRAINT fk_playlist
        FOREIGN KEY (playlist_id)
            REFERENCES playlist (id),
    song_id     INT(8)  NOT NULL,
    CONSTRAINT fk_song_playlist_song
        FOREIGN KEY (song_id)
            REFERENCES song (id),
    position    INT(10) NOT NULL,
    add_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);