use world;

select
    sum(Population)
from city
where CountryCode = 'KOR';

select
    min(Population) as 최소값
from city
where CountryCode ='KOR';

select
    avg(Population)
from city
where CountryCode = 'KOR';

select
    max(Population) as 최대값
from city
where CountryCode ='KOR';

select
    name,
    char_length(name)
from country;

select
    name,
    upper(left(name, 3))
from country
group by name;

select
    ROUND(LifeExpectancy, 1)
from country
