CREATE DATABASE db_spotifish;

CREATE TABLE account (
    id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    birth_date date,
    created_at datetime NOT NULL,
    email varchar(255) UNIQUE NOT NULL,
    gender ENUM('H', 'F', 'NB', 'A', 'NR') NOT NULL,
    name varchar(255) NOT NULL,
    newsletter tinyint(1) NOT NULL,
    password varchar(255) NOT NULL
);

CREATE TABLE subscription (
    id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    cost double NOT NULL,
    PRIMARY KEY(id)
);

CREATE table account_subscription (
    id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    account_id int(11) NOT NULL REFERENCES account(id),
    subscription_id int(11) NOT NULL REFERENCES subscription(id),
    effective_at datetime NOT NULL,
    finished_at datetime,
    PRIMARY KEY(id)
);

CREATE TABLE artist (
    id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    url_banner varchar(255) NOT NULL,
    certificate longtext NOT NULL,
    created_at datetime NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE album (
    id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    artist_id int(11) NOT NULL REFERENCES artist(id),
    name varchar(255) NOT NULL,
    released_at datetime NOT NULL,
    finished_at datetime NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE song (
    id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    duration int(11) NOT NULL,
    is_explicit tinyint(1) NOT NULL,
    PRIMARY KEY(id)
);