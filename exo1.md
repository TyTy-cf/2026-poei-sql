1.2

create table student(
    id int(6) not null auto_increment primary key,
    name varchar(64) not null,
    birthat date default null
)
engine = InnoDB
default character set = utf8;


1.3

alter table student
add column height int(3) default null;


1.4

alter table student
add column gender enum ('H','F','A') after name;