/*
JOIN
- 두개 이상의 테이블을 관련있는 컬럼을 통해서 결합하는데 사용
-- 반드시 연관있는 컬럼이 존재해야함
*/

/*
sqldb 데이터베이스에서 다음 조건을 처리하세요.
○ 각 사용자별로 구매 이력을 출력하세요.
○ userID, name, prodName, addr, 연락처를 다음과 같이 출력함
○ 연결 컬럼은 userID로 함
○ 구매이력이 없는 사용자도 출력하세요.
○ 결과를 userID를 기준으로 오름차순으로 정렬함
*/
select
    *
from buytbl b
    inner join usertbl u
    --  join usertbl u --inner 생략 가능
    on b.userID = u.userID
    -- using (userID)
    -- using : 컬럼명이 같을 경울 컬럼에 대한 조건을 작성해서 join 가능
where b.userID = 'JYP';

select  u.userID, u.name, b.prodName, u.addr, concat(u.mobile1, u.mobile2)
from usertbl u
    left outer join buytbl b
    on u.userID = b.userID
order by u.userID;

-- sqldb의 사용자를 모두 조회하되 전화가 없는 사람은 제외하고 출력하세요.
select *
from usertbl
where name not in (
    -- 유저중에 휴대폰번호기 없는사람 (null)
    select name
    from usertbl
    where mobile1 is null
    );

/*
UNION (합집합)
-- 두쿼리의 결과를 하나의 RESULT 로 합치는것
-- 중복된 행이 결과에 포함 X

UNION ALL (합집합 + 교집합)
-- 두쿼리의 결과를 하나의 RESULT 로 합치는것
-- 중복된 행이 결과에 포함 O
*/


select
    name,
    addr,
    mobile1
from usertbl
where  addr = '서울'
union -- 중복값 X
select
    name,
    addr,
    mobile1
from usertbl
where mobile1 = '011';

select
    name,
    addr,
    mobile1
from usertbl
where  addr = '서울'
union all -- 중복값 O
select
    name,
    addr,
    mobile1
from usertbl
where mobile1 = '011';