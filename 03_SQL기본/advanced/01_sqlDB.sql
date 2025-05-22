use sqldb;

select
    userID as '사용자 아이디',
    sum(amount) as '총 구매 개수'
from buytbl
group by userID ;


select
    userID as '사용자 아이디',
    sum(price * amount) as '총 구매액'
from buytbl
group by userID ;

select
    avg(amount) as '평균 구매 개수'
from buytbl;

select
    userID,
    avg(amount) as '평균 구매 개수'
from buytbl
group by userID ;

select
    name,
    height
from usertbl
where height = (select max(height) from usertbl)
or height = (select min(height) from usertbl);

select
    count(mobile1) as '휴대폰이 있는 사용자'
from usertbl;

select
    userID as 사용자,
    sum(price * amount) as 총구매액
from buytbl
group by userID
HAVING sum(price * amount) >= 1000;
