### 1.1

create database tp
    default character set utf8;


### 1.2

create table student(
    id int(6) not null auto_increment primary key,
    name varchar(64) not null,
    birthat date default null
)
engine = InnoDB
default character set = utf8;


### 1.3

alter table student
add column height int(3) default null;


### 1.4

alter table student
add column gender enum ('H','F','A') after name;


### 1.5

alter table student
drop column name;


### 1.6

create table course(
    id int not null auto_increment primary key,
    name varchar(64) not null,
    description text default null,
    start date not null,
    end date not null,
    totalhours int(8) not null
)
engine = InnoDB
default character set = utf8;