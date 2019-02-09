CREATE SEQUENCE seq_user START WITH 1 INCREMENT BY 1;

DROP SEQUENCE user_id;

CREATE TABLE users
(user_id int default seq_user.nextval NOT NULL,
login varchar2(20) not null,
pass varchar(20) not null,
first_name varchar2(20) not null,
last_name varchar2(20) not null,
e_mail varchar2(30) not null,
prmission_level int not null,
level_state varchar2(20) not null,
CONSTRAINT user_id_pk PRIMARY KEY (user_id));

CREATE SEQUENCE seq_children START WITH 1 INCREMENT BY 1;


CREATE TABLE children
(  id int default seq_children.nextval not null,
    guardian_id int not null,
  CONSTRAINT children_id_pk
    FOREIGN KEY (guardian_id)
    REFERENCES users(user_id)
);

CREATE TABLE points(
user_id int not null,
points int not null,
level1 int not null,
school_rec int,
day_rec int, 
points_type varchar2(20),
CONSTRAINT points_id_pk
FOREIGN KEY (user_id)
REFERENCES users(user_id));

CREATE TABLE permissions(
level_id int primary key,
odczyt int,
zapis int,
edycja int);

CREATE TABLE home_points(
id_child int primary key,
points_name varchar2(20),
points_value int,
order_list int,
max_use_day int,
max_use_week int);

CREATE TABLE bans(
id_child int,
ban_name varchar2(30),
date_end date);

CREATE TABLE lessons(
lesson_id int primary key,
lesson_name varchar2(20));

CREATE TABLE works(
works_id int primary key,
works_name varchar2(20));

CREATE TABLE weekday(
id_day int primary key,
day_name varchar2(10));

CREATE TABLE plan(
id int primary key,
child_id int,
day_id int,
lesson_id int,
works_id int,
thisdate date,
school_points int);



drop table points;





drop table children;


