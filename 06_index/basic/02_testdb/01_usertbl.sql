use testdb;

drop table if exists usertbl;

create table usertbl
(
    userID    char(8)     not null primary key,
    name      varchar(10) not null,
    birthYear int         not null,
    addr      nchar(2)    not null
);

insert into usertbl
values ('LSG', '이승기', 1987, '서울'),
       ('KBS', '김범수', 1979, '경남'),
       ('KKH', '김경호', 1971, '전남'),
       ('JYP', '조용필', 1950, '경기'),
       ('S나', '성시경', 1979, '서울');

select *from usertbl;

-- usertbl에서 primary key 제약조건 삭제
alter table usertbl drop primary key;

-- primary key 설정
alter table usertbl
add constraint pk_name primary key (name);

-- 클러스트형 인덱스가 userID에서 name으로 바뀌어
-- name 순으로 정렬
select * from usertbl;



