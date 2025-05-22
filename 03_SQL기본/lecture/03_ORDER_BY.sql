-- ORDER BY
-- SELECT 문과 함께 사용하며 결과 집ㅎ바을 특정 열이나 값들에 따라 정렬하는데 사용

select
    emp_no,
    first_name,
    last_name
from
    employees
order by
    -- emp_no asc; -- 오름차순
    -- emp_no desc; -- 내림차순
    emp_no; -- 오름 차순 (default)


-- 컬럼에 따라 정렬을 여러번 할 수 있다
-- fist-name 기준으로 정렬, 만약 같은 순위의 데이터가 있다면 last_name으로 정력ㄹ
select
    emp_no,
    first_name,
    last_name
from
    employees
order by
    first_name desc,
    last_name;

