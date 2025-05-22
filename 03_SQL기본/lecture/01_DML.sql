/*
DML (Data Manipulation Language)
-- 데이터 조작언어, 테이블 값을 삽입, 수정, 삭제 하는 SQL
*/

/*
INSERT
-새로운 행을 추가하는 구문
- null 허용 가능한 컬럼이나  auto increment가 있는 컬럼 제외하고
 insert하고 싶은 데이터 컬럼을 지정하고 INSERT 가능

- PRIMARY KEY : 기본키, 유연성과 최소성을 만족, 해당 행을 식별할떄 사용되는 값
*/

insert into
    employees
values
    (1, 20250414, '예성', '강', 'M', 20250514);

insert into
    employees (emp_no, birth_date, last_name, first_name, gender, hire_date)
values
    (2, 20250414, '옥', '가연', 'F', 20250514);

-- 여러 컬럼을 한번에 insert
insert into
    employees
values
    (3, 20250414, '김', '규연', 'F', 20250514),
    (4, 20250414, '구', '석현', 'M', 20250514);


-- UPDATE
-- 테이블에 기록된 컬럼의 값을 수정하는 구문

select
    *
from
    employees
where last_name = '규연';

update employees
set -- 이렇게 바꿀거다
    last_name = '김',
    first_name = '규연'
where -- 여기에 해당하는 내용만
    last_name = '규연';

update employees
set
    last_name = '구',
    first_name = '석현'
where
    last_name = '석현';

-- DELETE
-- 테이블의 행을 삭제하는 구문
DELETE
from employees
where last_name= '김';

-- REPLACE
-- INSERT 할때 PRIMARY KEY 혹은 UNIQUE KEY가 충돌될경우 해당 행에 덮어씌우기
insert into -- 오류 발생
    employees
values
    (4, 20250414, '구', '석현', 'M', 20250514);

replace into
    employees
values
    (4, 20250414, '구', '석', 'M', 20250514);




