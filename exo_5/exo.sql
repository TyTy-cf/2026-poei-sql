CREATE DATABASE db_spotifish;

CREATE TABLE account (
    id int(8) NOT NULL AUTO_INCREMENT,
    name varchar(80) NOT NULL,
    email varchar(120) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
    birth_date date,
    gender ENUM('H', 'F', 'NB', 'A', 'NR') NOT NULL,
    newsletter tinyint(1) NOT NULL,
    created_at datetime NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE subscription (
    id int(8) UNIQUE NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    cost double NOT NULL,
    PRIMARY KEY(id)
);

CREATE table account_subscription (
    id int(8) UNIQUE NOT NULL AUTO_INCREMENT,
    account_id int(8) NOT NULL REFERENCES account(id),
    subscription_id int(8) NOT NULL REFERENCES subscription(id),
    effective_at datetime NOT NULL,
    finished_at datetime,
    PRIMARY KEY(id)
);

CREATE TABLE artist (
    id int(8) UNIQUE NOT NULL AUTO_INCREMENT,
    name varchar(80) NOT NULL,
    email varchar(120) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
    url_banner varchar(255) NOT NULL,
    certificate text NOT NULL,
    created_at datetime NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE album (
    id int(8) UNIQUE NOT NULL AUTO_INCREMENT,
    artist_id int(8) NOT NULL REFERENCES artist(id),
    name varchar(255) NOT NULL,
    published_at datetime NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE song (
    id int(8) UNIQUE NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    duration int(6) NOT NULL,
    explicit tinyint(1) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE album_song (
    album_id int(8) NOT NULL REFERENCES album(id),
    song_id int(8) NOT NULL REFERENCES song(id),
    PRIMARY KEY(album_id, song_id)
);

CREATE TABLE playlist (
    id int(8) UNIQUE NOT NULL AUTO_INCREMENT,
    account_id int(8) NOT NULL REFERENCES account(id),
    name varchar(80) NOT NULL,
    created_at datetime NOT NULL,
    updated_at datetime,
    PRIMARY KEY(id)
);

CREATE TABLE playlist_song (
    id int(8) UNIQUE NOT NULL AUTO_INCREMENT,
    playlist_id int(8) NOT NULL REFERENCES playlist(id),
    song_id int(8) NOT NULL REFERENCES song(id),
    position int(10) NOT NULL,
    add_at datetime NOT NULL,
    PRIMARY KEY(id)
);