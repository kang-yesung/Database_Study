use tabledb;

drop view if exists v_usebuytbl;
drop table if exists buytbl;
drop table if exists usertbl;

create table userTBL(
    userID char(8) not null primary key,
    name varchar(10) not null,
    birthear int not null
);

create table buyTBL(
    num int auto_increment not null primary key,
    userID char(8) not null,
    prodName char(6) not null
);

alter table buyTBL
add constraint
foreign key (userID)
references userTBL(userID);

drop table if exists buyTBL;
drop table if exists userTBL;

create table userTBL(
    userID char(8) not null primary key,
    name varchar(10) not null,
    birthyear int not null,
    email char(30) unique
);

drop table if exists userTBL;

create table userTBL(
    userID char(8) not null primary key,
    name varchar(10),
    birthyear int check ( 1900<= birthyear and birthyear<=2023 ),
    mobile char(3) not null
);

drop table userTBL;

create table userTBL(
    userID char(8) not null primary key,
    name varchar(10) not null,
    birthyear int not null default -1,
    addr char(2) not null default '서울',
    mobile1 char(3),
    mobile2 char(8),
    height smallint default 170,
    mDate DATETIME
);

alter table userTBL
drop mobile1;

alter table userTBL
change name uName varchar(10);

alter table userTBL
drop primary key;



