create database Details
create table Departments
(
dep_id int,
dep_name varchar(20),
dep_location varchar(15)
);
create table Salary_grade
(
grade int,
min_salary int,
max_salary int
);
create table employees
(
emp_id int,
emp_name varchar(15),
job_name varchar(10),
manager_id int,
hire_date date,
salary decimal(10,2),
commition decimal(7,2),
dep_id int
);
insert into employees(emp_id, emp_name, job_name, hire_date, salary, dep_id)
values(68319, 'KAYLING', 'PRESIDENT', '1991-11-18' ,6000.00, 1001);

insert into employees(emp_id, emp_name, job_name, manager_id, hire_date, salary, dep_id)
values(69324,'MARKER','CLERK',67832,'1992-01-23',1400.00,1001);

insert into employees(emp_id, emp_name, job_name, manager_id, hire_date, salary, commition, dep_id)
values(68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600.00,0.00,3001);

insert into Salary_grade(grade,min_salary,max_salary)
values(5, 3101, 9999);

update Salary_grade set min_salary =1301 where grade = 2;
alter table employees commition commission decimal;

select * from Salary_grade;

select * from employees;

select salary from employees;

select distinct job_name from employees;

select emp_name,format(1.15*salary,'C')AS "salary" from employees;

select emp_name,job_name from employees;

select CONCAT (emp_name,'  ',job_name) "Employee & job" from employees;

select emp_id,emp_name,salary,FORMAT(hire_date,'MMMM dd,yyyy')as "hire date" from employees;

select len(emp_name ) as emp_name from employees;

select emp_id, salary, commition from employees;

SELECT *FROM employees WHERE dep_id NOT IN (2001);

select * from employees where hire_date < ('1991-1-1');

SELECT avg(salary) FROM employees WHERE job_name = 'ANALYST';

select * from employees where emp_name = 'BLAZE';

SELECT * FROM employees WHERE (1.25*salary) > 3000;

SELECT * FROM employees WHERE MONTH (hire_date)='01';

select emp_id,	emp_name,	hire_date,salary from employees where hire_date < ('1991-04-1');

select emp_name, salary from employees,Salary_grade where emp_name = 'FRANK' and salary between min_salary and max_salary and salary = max_salary;

select * from employees  where job_name not in ('PRESIDENT','MANAGER') ORDER BY salary ASC;

select MAX(salary) as "max" from employees;

select job_name,avg(salary) as "avg" ,avg(salary+ commition) as "avg" from employees group by job_name;

insert into Departments(dep_id ,dep_name , dep_location)
values
(1001,'FINANCE','SYDNEY'),
(2001,'AUDIT','MELBOURNE'),
(3001,'MARKETING','PERTH'),
(4001,'PRODUCTION','BRISBANE');
select * from Departments;

select emp.emp_id, emp.emp_name,dep.dep_id, dep.dep_location, dep.dep_name  from employees emp, Departments dep 
where emp.dep_id=dep.dep_id and emp.dep_id in ('1001','2001');

select manager_id, count(*) as "count" from employees group by manager_id order by manager_id asc;

select dep_id,count(*) as "count" from employees group by dep_id having count(*)>=2;

select * from employees where emp_name like '%AR%';

alter table employees
add gender varchar(20);

update employees set gender = 'MALE' where emp_id in ('68319','66928','65646','69062','68454','69324'); 
update employees set gender = 'FEMALE' where emp_id NOT IN ('68319','66928','65646','69062','68454','69324');
select * from employees;

update employees set commition=650.00 from employees where job_name='ANALYST' and exists(select job_name from employees where job_name='ANALYST'); 
select * from employees;
