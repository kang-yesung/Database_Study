-- 데이터 베이스 존재하면 삭제
drop database if exists tabledb;

-- 데이터 베이스 생성
create database tabledb;



drop table if exists usertbl;

-- usertbl 생성
create table usertbl
(
    -- 컬럼 타입 제약조건
    userId    char(8)     not null primary key,
    name      varchar(10) not null,
    birthyear int         not null,
    addr      varchar(2)  not null,
    mobile1   char(3),
    mobile2   char(8),
    height    smallint,
    mDate     date
);

drop table if exists buytbl;
create table buytbl
(
    num       int auto_increment not null primary key,
    userID    char(8)            not null,
    prodName  char(6)            not null,
    groupName char(4),
    price     int                not null,
    amount    smallint           not null,
    -- foreign key (현재테이블컬럼명)
    -- references [참조할테아블명] (참조할컬럼)
    foreign key (userID) references usertbl (userId)
);
