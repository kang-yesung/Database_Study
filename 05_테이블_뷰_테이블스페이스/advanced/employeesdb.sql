use employees;

create view EMPLOYEES_INFO as
select
    e.emp_no,
    e.birth_date,
    e.first_name,
    e.last_name,
    e.gender,
    e.hire_date,
    t.title,
    t.from_date as t_from,
    t.to_date as t_to,
    s.salary,
    s.from_date as s_from,
    s.to_date as s_toid
from employees e
join titles t on e.emp_no = t.emp_no
join salaries s on e.emp_no = s.emp_no;

select *
from EMP_DEPT_INFO
where to_date = '9999-01-01';

create view EMP_DEPT_INFO as
select
    e.emp_no,
    d.dept_no,
    dt.dept_name,
    d.from_date,
    d.to_date
from employees e
         join dept_emp d on e.emp_no = d.emp_no
         join departments dt on d.dept_no = dt.dept_no;

select
    *
from EMP_DEPT_INFO
where to_date = '9999-01-01'