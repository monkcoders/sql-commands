create database setExample;
use setExample;

create table dept1(
	empId int Primary Key,
    name varchar(30),
    role varchar(25)
    );

create table dept2(
	empId int Primary Key,
    name varchar(30),
    role varchar(25)
    );

INSERT INTO dept1 ( empId,name,role) values
(1,'A','engineer'),
(2,'B','salesman'),
(3,'C','manager'),
(4,'D','salesman'),
(5,'E','engineer');

INSERT INTO dept2 ( empId,name,role) values
(3,'C','manager'),
(6,'F','marketing'),
(7,'G','salesman');


select * from dept1;
select * from dept2;

-- SET OPERATIONS
-- List out all the employees in the company
select * from dept1
Union 
select * from dept2;

-- list out all the employees in all departments who work as salesman
-- union
select * from dept1 where role = 'salesman'
Union
select * from dept2 where role='salesman';

-- list out all the employees who work in all the departments.
-- we emulate intersection by applying inner join on both the tables 
-- intersection
select d1.* from dept1 as d1
Inner Join dept2 as d2 using(empId);

-- List out all the employees working in dept1 but not in dept2.
-- minus
select d1.* from dept1 as d1 
LEft Join dept2 as d2 using(empId)
where d2.empId is NULL;