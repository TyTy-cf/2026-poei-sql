### 1.1

```sql
create database tp
    default character set utf8;
```

### 1.2

```sql
create table student(
    id int(6) not null auto_increment primary key,
    name varchar(64) not null,
    birthAt date default null
)
engine = InnoDB
default character set = utf8;
```

### 1.3

```sql
alter table student
add column height int(3) default null;
```

### 1.4

```sql
alter table student
add column gender enum ('H','F','A') default null after name;
```

### 1.5

```sql
alter table student
drop column name;
```

### 1.6

```sql
create table course(
    id int not null auto_increment primary key,
    name varchar(64) not null,
    description text not null,
    duration int(4) default null,
    createdAt datetime not null,
    is_active tinyint default 1
)
engine = InnoDB
default character set = utf8;
```