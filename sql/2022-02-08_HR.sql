select e.employee_id, e.first_name, d.department_name, e.salary, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id;

select e.employee_id, e.first_name, 
          sub_tbl.department_name, e.salary, sub_tbl.city
from employees e, (select department_id, department_name, city
                              from departments d, locations l
                              where d.location_id = l.location_id) sub_tbl
where e.department_id = sub_tbl.department_id;

--7�࿡�� from��ȣ�� ������ ���ο� ǥ�θ����.
create view city_view
as
select department_id, department_name, city
                              from departments d, locations l
                              where d.location_id = l.location_id;
                              
select * from city_view;

--������ ���� ���ϼ� �ְԵȴ�.
select e.employee_id, e.first_name, 
          sub_tbl.department_name, e.salary, sub_tbl.city
from employees e, city_view sub_tbl
where e.department_id = sub_tbl.department_id;

select first_name, department_name, salary, city
from(select e.employee_id, e.first_name, 
        sub_tbl.department_name, e.salary, sub_tbl.city
        from employees e, (select department_id, department_name, city
                                       from departments d, locations l
                                       where d.location_id = l.location_id) sub_tbl
        where e.department_id = sub_tbl.department_id)
--28����� 33���� ������ ǥ �����Ͱ� �ȴ�.
where salary>=15000;

