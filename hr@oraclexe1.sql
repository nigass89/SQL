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
child_id int not null,
points int not null,
level1 int not null,
school_rec int,
day_rec int, 
points_type varchar2(20),
CONSTRAINT points_id_pk
FOREIGN KEY (child_id)
REFERENCES children(id));

CREATE TABLE permissions(
level_id int,
odczyt int,
zapis int,
edycja int,
CONSTRAINT permissions_id_pk
FOREIGN KEY (level_id)
REFERENCES users(prmission_level));

CREATE TABLE home_points(


drop table points;





drop table children;


