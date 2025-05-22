-- WHERE
-- 특정 조건에 맞는 레코드(데이터)만을 선택하는데 사용됨

-- = 같음 연산자를 사용한 where

select
    *
from employees
where
    gender = 'M' -- 성별이 'M'인 애들만
limit 5;

-- select에 담지 않더라도 다른 컬럼의 속성으로 조건을 걸 수 있음
select
    first_name,
    last_name,
    gender
from employees
where
    -- gender != 'M' -- 성별이 'M'아닌 애들만
    gender <> 'M' -- 성별이 'M'아닌 애들만
limit 5;

-- AND 연산자 : 둘다 true ? 하나라도 false면 false
-- OR 연산자 : 둘 중 하나라도 true면 true
-- AND가 OR 보다 우선 순위가 높다
-- 1 : true
-- 0 : false
select  1 OR 0 AND 0;
select  (1 OR 0) AND 0;

select
    emp_no,
    first_name,
    last_name,
    gender
from employees
where
    gender <> 'M' AND
    emp_no < '10050'; -- emp_no dl 10050 보다 작고 , gender가 'M' 이 아닌 조건

-- BETWEEN
select
    *
from
    employees
where
    emp_no >= 10050 AND
    emp_no <= 10060;
/*
BETWEE 연산자
- 경계값을 포함한, 사이값을 포함
*/
select
    *
from
    employees
where
    emp_no not between 10005 AND 499995; -- 부정표현 (경계값 및 사이값 포함안하고 나머지 값을 포함)

/*
LIKE
- 특정 패턴과 일치하는 행을 검색

패턴
- % : 0개 이상의 문자를 나타냄
ex) '%apple%', -> apple이 포힘된 모든 문자열
- _ : 1개의 문자를 나타냄
ex) 'a_k는  a 로 시작하고 k로 끝나는 세글자 문자열
*/

select
    first_name
from
    employees
where
    first_name like 'Aa%;';

select
    first_name
from
    employees
where
    first_name like 'Aa__d;'; -- Aa로 시작하고 d로 끝나면서 5글자인 모든 데이터

/*
IN 연산자
- 특정 열의 값이 지정된 목록중 하나와 일치하는지 확인하는데 사용
*/
select
    *
from
    employees
where
    emp_no in (1,2,3,4,5);