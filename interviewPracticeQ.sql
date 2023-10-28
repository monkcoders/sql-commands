-- interview quetions praction on org database

CREATE DATABASE ORG;
SHOW DATABASES;

USE ORG;


CREATE TABLE Worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR(25),
    LAST_NAME VARCHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(25)
    );
    
INSERT INTO Worker
(WORKER_ID, FIRST_NAME,LAST_NAME , SALARY,JOINING_DATE, DEPARTMENT) VALUES 
 (001,'Monika','Arora', 100000,'14-02-20 09.00.00', 'HR'),
 (002,'Niharika','Verma', 80000, '14-06-11 09.00.00','Admin'),
 (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00','HR'),
 (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
 (005, 'Vivek','Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
 (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00','Account'),
 (007,'Satish', 'Kumar', 75000, '14-01-20 09.00.00','Account'),
 (008,'Geetika','Chauhan', 90000, '14-04-11 09.00.00','Admin' );
    
SELECT * FROM Worker;

CREATE TABLE Bonus(
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
        );
        
INSERT INTO BONUS 
(WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE) VALUES
(001, 5000,'16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000,'16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');



SELECT * FROM bonus;

CREATE TABLE Title(
	WORKER_REF_ID INT,
    WORKER_TITLE VARCHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
    REFERENCES Worker( WORKER_ID)
    ON DELETE CASCADE
    );

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005,'Manager', '2016-06-11 00:00:00'),
(004,'Asst. Manager', '2016-06-11 00:00:00'),
(007,'Executive','2016-06-11 00:00:00'),
(006,'Lead','2016-06-11 00:00:00'),
(003,'Lead','2016-06-11 00:00:00');

SELECT * FROM TITLE;

-- truncate table title;


-- show tables;

-- drop database org;



-- interview questions practice 
-- Q1 write an SQL query to fetch "FIRST_NAME" from Worker table using the alias name as <WORKER_NAME>.
select first_name as WORKER_NAME from worker;

-- Q2 write an SQL query to fetch "FIRST_NAME" from Worker table in upper case.
select ucase(first_name) as first_name from worker;

-- Q3 write an SOL query to fetch unique values of DEPARTMENT from Worker table.
select distinct(department) from worker;
-- using goup by 
select department from worker group by department;

-- Q4 write an SOL query to print the first three characters of FIRST NAME from Worker table.
select substring(first_name,1,3) from worker;
-- The SUBSTRING() function extracts a substring from a string (starting at any position).
-- Note: The SUBSTR() and MID() functions equals to the SUBSTRING() function.
-- syntax: SUBSTRING(string, start, length)  
-- or 
-- syntax: SUBSTRING(string, start, length)

-- Q5 write an SOL query to find the position of the alphabet ('b') in the first name column 'Amitabh' from worker table
select position('a' IN first_name) as POSITION from worker ;
-- The POSITION() function returns the position of the first occurrence of a substring in a string.
-- If the substring is not found within the original string, this function returns 0.
-- This function performs a case-insensitive search.
-- Note: The LOCATE() function is equal to the POSITION() function.
-- syntax : POSITION(substring IN string)


-- or 
-- The INSTR() function returns the position of the first occurrence of a string in another string.
-- This function performs a case-insensitive search.
-- syntax: INSTR(string1, string2)
-- sql follows 1 based indexing 
select INSTR(first_name,'b') from worker where first_name ='amitabh';

-- Q6 write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side
select rtrim(first_name) from worker;


-- Q7 write an SOL query to print the DEPARTMENT from Worker table after removing white spaces from the left side
select ltrim(department) from worker;

-- Q8. Write an SOL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct department, length(department) from worker;

-- Q9. Write an SOL query to print the FIRST_NAME from Worker table after replacing 'a' with 'A'
select replace(first_name,'a','A') from worker;
-- Q10. Write an SOL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
-- concat can take any no of expressions 
select concat(first_name,' ',last_name) as COMPLETE_NAME from worker;
-- Q11. Write an SOL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by FIRST_NAME;

-- Q12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
-- sorts table based on first_name and if duplicate name esiste sorts them based on department
select * from worker order by first_name ASC, department desc;

-- Q13. Write an SOL query to print details for Workers with the first name as "Vipul" and "Satish" from Worker table.
select * from worker where first_name='Vipul' or first_name = 'Satish';
-- or 
select * from worker where first_name IN ('Vipul','Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, "Vipul" and "Satish" from Worker table.
select * from worker where first_name NOT IN ('Vipul','Satish');
-- Q15. Write an SQL query to print details of Workers with DEPARTMENT name as "Admin*"
select * from worker where department like'Admin%';

-- Q16. Write an SOL query to print details of the Workers whose FIRST_NAME contains 'a'
select * from worker where first_name like '%a%';

-- Q17. Write an SOL query to print details of the Workers whose FIRST_NAME ends 'a'
select * from worker where first_name like '%a';

-- Q18. Write an SOL query to print details of the Workers whose FIRST_NAME ends 'h' and contains 6 alphabests
select * from worker where first_name like '_____h';

-- Q19. Write an SOL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000;

-- Q20. Write an SQL query to print details of the Workers who have joined in Feb'2014.
select * from worker where YEAR(JOINING_DATE) =2014 and MONTH(JOINING_DATE)=2;	

-- Q21. Write an SOL query to fetch the count of employees working in the department 'Admin'
select count(worker_id) from worker where department='admin';

-- Q22. Write an SOL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(first_name,' ',LAST_NAME) from worker where salary between 50000 and 100000;

-- Q23. Write an SQL query to fetch the no. of workers for each department in the descending orde
select department,count(department) from worker group by department order by COUNT(department) desc;

-- Q24. Write an SQL query to print details of the Workers who are also Managers.
select w.* from worker as w INNER JOIN title as t ON w.worker_id =t.worker_ref_id where t.worker_title='Manager';
-- or 
select w.* from worker as w, title as t where w.worker_id =t.worker_ref_id and t.worker_title='Manager';

-- Q25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different type.
select worker_title, count(worker_title) from title group by worker_title having count(worker_title)>1;

-- Q26. Write an SQL query to show only odd rows from a table.
select * from worker where worker_id%2=1;
-- or
select * from worker where MOD(worker_id,2) !=0;
-- or
select * from worker where MOD(worker_id,2) <> 0;

-- Q27. Write an SOL query to show only even rows from a table.
select * from worker where MOD (WORKER_ID, 2) = 0;

-- Q28. Write an SOL query to clone a new table from another table.
-- we can use like keyword to create a clone of a table 
create table worker_clone like worker;
-- data can be cloned by simply inserting all  data from original table to clone table using *
INSERT INTO worker_clone select * from worker;
select * from worker_clone;
select * from worker;	
delete from worker_clone where worker_id IN (2,4,5);
 
-- Q29. Write an SQL query to fetch intersecting records of two tables.
-- intersection of 2 tables using inner join 
select w1.* from worker as w1 
INNER JOIN worker_clone as w2 
USING(worker_id); 

-- Q30. Write an SOL query to show records from one table that another table does not have.
-- minus operation using left join
select w1.* from worker as w1 
LEFT JOIN worker_clone as w2 
USING(worker_id) where w2.worker_id is NULL;
 
-- Q31. Write an SQL query to show the current date and time.
-- using dual tables
select now() as CURRENT_DATETIME;
select curdate();

-- Q32. Write an SOL query to show the top n (say 5) records of a table order by descending salary.
select  * from worker  order by salary desc limit 5 ; 
-- limit : it limits the no of entries returned by the query
-- offset it ignore this many no of columns and applies limit after this many columns

-- Q33. Write an SOL query to determine the nth (say n=5) highest salary from a table.
select *from worker order by salary desc limit 1 offset 4;
-- or 
select * from worker order by salary desc limit 4,1;
-- we can apply offset directly using limit only 
-- syntax for using limit :
-- LIMIT no_of_row   => it returns no of rows from starting
-- LIMIT offset,no_of_rows  => it ignores offset no of rows and start after them and print no_of_rows there by

-- Q34. Write an SOL query to determine the 5th highest salary without using LIMIT keyword.
-- using subquery -- correlated queries
select * from worker as w1 where 4 = (select count(distinct(salary)) from worker as w2 where w2.salary>=w1.salary);

-- Q35. Write an SOL query to fetch the list of employees with the same salary.
select * from worker as w1 where salary IN ( select distinct(salary) from worker as w2 group by salary having count(salary)>1);
-- or
select w1.* from worker as w1, worker as w2 where w1.salary= w2.salary and w1.worker_id <> w2.worker_id; 

-- Q36. Write an SOL query to show the second highest salary from a table, using sub queries 
-- if 2 rows have same values then thier rank is also same 
select salary from worker order by salary desc limit 1,1;
-- or 
select max(salary) from worker where salary NOT IN (select max(salary) from worker);

-- Q37. Write an SQL query to show one row twice in results from a table.
select * from worker
union all
select * from worker order by worker_id;

-- Q38. Write an SOL query to list worker_id who does not get bonus.
select worker_id from worker where worker_id not in ( select worker_ref_id from bonus);

-- Q39 wrte an SQL query to fetch first 50% records from the table .
select * from worker where worker_id<= (select count(worker_id)/2 from worker);

-- Q40 wrte an SQL query to fetch departments that have less than 4 people in it.
select department , count(department)from worker group by department having count(department)<4;

-- Q40 wrte an SQL query to fetch all departments along with the no of people in there.
select department , count(department)from worker group by department ;

-- Q42. Write an SOL query to show the last record from a table.
select * from worker order by worker_id desc limit 1;
-- or
select * from worker where worker_id In ( select max(worker_id) from worker);

-- Q43. Write an SQL query to fetch the first row of a table. 
select * from worker limit 1;
-- or 
select * from worker where worker_id In ( select MIN(worker_id) from worker);

-- Q44. Write an SQL query to fetch the last five records from a table.
select * from (select * from worker order by worker_id desc limit 5) as temp order by worker_id;

-- Q45. Write an SQL query to print the name of employees having the highest salary in each department.
select * from worker where salary In ( select max(salary) from worker group by department);
-- or using join and derived tables
select w.* from worker as w 
INNER JOIN ( select department, max(salary) as salary from worker group by department ) as temp 
ON w.salary = temp.salary and w.department= temp.department;

-- Q45 Write an SOL query to fetch three max salaries from a table using co-related subquery
select distinct salary from worker as w1 where 3>= (select count( distinct salary) from worker as w2 where w2.salary>=w1.salary) order by salary desc;
-- using limt 
select distinct salary from worker order by salary desc limit 3; 

-- Q47. Write an SOL query to fetch three min salaries from a table using co-related subquery
select distinct salary from worker as w1 where 3>= (select count( distinct salary) from worker as w2 where w2.salary<=w1.salary) order by salary ;

-- Q48. Write an SQL query to fetch nth max salaries from a table.
-- Q49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
-- Q50. Write an SOL query to fetch the names of workers who earn the highest salary.
