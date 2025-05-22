-- 모든 문제는 employees 데이터베이스에서 수행한다.
-- employees db의 ERD

use employees;

-- 현재 재직 중인 직원의 정보를 출력하세요
-- ○ 출력 항목: emp_no, first_name, last_name, title
select
    e.emp_no,
    e.first_name,
    e.last_name,
    t.title
from employees e
    join titles t on e.emp_no = t.emp_no
where t.to_date = '9999-01-01';

-- 현재 재직 중인 직원 정보를 출력하세요
-- ○ 출력항목: 직원의 기본 정보 모두, title, salary
select
    e.*,
    t.title,
    s.salary
from employees e
    join titles t
        on e.emp_no = t.emp_no
    join salaries s
        on e.emp_no = s.emp_no
where t.to_date = '9999-01-01';

-- 현재 재직중인 직원의 정보를 출력하세요.
-- ○ 출력항목: emp_no, first_name, last_name, department
-- ○ 정렬: emp_no 오름 차순
select
    e.emp_no,
    e.first_name,
    e.last_name,
    dt.dept_name
from employees e
    join dept_emp d
        on e.emp_no = d.emp_no
    join departments dt
        on d.dept_no = dt.dept_no
where d.to_date = '9999-01-01'
order by e.emp_no;

-- 부서별 재직중인 직원의 수를 출력하세요.
-- ○ 출력 항목: 부서 번호, 부서명, 인원수
-- ○ 정렬: 부서 번호 오름차순
select
    d.dept_no,
    dt.dept_name,
    count(e.emp_no)
from employees e
    join dept_emp d
        on e.emp_no = d.emp_no
    join departments dt
        on d.dept_no = dt.dept_no
where d.to_date = '9999-01-01'
group by d.dept_no
order by d.dept_no;

-- 직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요.
-- ○ 출력항목: emp_no, first_name, last_name, dept_name, from_date, to_date
select
    e.emp_no,
    e.first_name,
    e.last_name,
    dt.dept_name,
    d.from_date,
    d.to_date
from employees e
    join dept_emp d
        on e.emp_no = d.emp_no
    join departments dt
        on d.dept_no = dt.dept_no
where e.emp_no = 10209;

