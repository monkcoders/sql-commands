-- subqueries 

use joinExample;

show tables;

-- learing and practicing sql subqueries 
-- applying subqueries at the where clause on the same table
-- find employees with age >30
select * from employee 
where age IN (select age from employee where age>30);

-- other way to get same output is  
select * from employee where age>30;

-- where clause subquery on other table
-- employee detail working in more than 1 projects
select * from employee 
where id IN ( select empId from project group by empId having count(empId)>1);


-- single value subquery 
-- find employee having age> avg age
select * from employee 
where age> ( select avg(age) from employee);

-- using from cluse we can also use derived table in our subquery rather than using a defined table 
-- derived tables are the tables that we get as an output from a query, to use them after from key word we need to give alias to them 
-- find max age of the employee having 'a' in thier first name 
select max(age) from (select * from employee where fname like '%a%');

-- correlatd query 
-- it executes inner query for each item of outer query 
-- find the 3rd largest  emplyoee by age
select * from employee as e1 
where 3= (select count(e2.age) from employee as e2 where e2.age>=e1.age);