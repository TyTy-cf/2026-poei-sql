DROP TABLE IF EXISTS playlist_song;
DROP TABLE IF EXISTS album_song;
DROP TABLE IF EXISTS playlist;
DROP TABLE IF EXISTS song;
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS account_subscription;
DROP TABLE IF EXISTS subscription;
DROP TABLE IF EXISTS account;

CREATE TABLE account
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(80)  NOT NULL,
    email      VARCHAR(120) NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    birth_date DATE,
    gender     ENUM('H', 'F', 'NB', 'A', 'NR') NOT NULL,
    newsletter TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE subscription
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)   NOT NULL DEFAULT 'FREE',
    cost DECIMAL(10, 2) NOT NULL DEFAULT 0
);

CREATE TABLE account_subscription
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    account_id      INT      NOT NULL,
    subscription_id INT      NOT NULL,
    effective_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    finished_at     DATETIME NULL,

    FOREIGN KEY (account_id) REFERENCES account (id),
    FOREIGN KEY (subscription_id) REFERENCES subscription (id)
);

CREATE TABLE artist
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(80)  NOT NULL,
    email       VARCHAR(120) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    banner_url  VARCHAR(255),
    certificate TEXT,
    created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE album
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    artist_id    INT          NOT NULL,
    name         VARCHAR(255) NOT NULL,
    published_at DATE,

    FOREIGN KEY (artist_id) REFERENCES artist (id)
);

CREATE TABLE song
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(255) NOT NULL,
    duration INT          NOT NULL,
    explicit TINYINT(1) NOT NULL DEFAULT 0
);

CREATE TABLE album_song
(
    album_id INT NOT NULL,
    song_id  INT NOT NULL,

    PRIMARY KEY (album_id, song_id),

    FOREIGN KEY (album_id) REFERENCES album (id),
    FOREIGN KEY (song_id) REFERENCES song (id)
);

CREATE TABLE playlist
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT         NOT NULL,
    name       VARCHAR(80) NOT NULL,
    created_at DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,

    FOREIGN KEY (account_id) REFERENCES account (id)
);

CREATE TABLE playlist_song
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    playlist_id INT      NOT NULL,
    song_id     INT      NOT NULL,
    position    INT      NOT NULL,
    add_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (playlist_id) REFERENCES playlist (id),
    FOREIGN KEY (song_id) REFERENCES song (id)
);