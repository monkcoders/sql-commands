SHOW DATABASES;

CREATE DATABASE temp;

USE temp;
CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(20)
);

SHOW tables;

INSERT INTO student values(1,'Abhishek');
SELECT * FROM student;

DROP DATABASE IF  EXISTS temp;

SELECT 12 +34;

SELECT UCASE("aBhishek");

SELECT LCASE("ABHISHEK");

SELECT NOW();

USE org;
SELECT * FROM WORKER;

SELECT * FROM WORKER WHERE SALARY>80000;

SELECT * FROM WORKER WHERE DEPARTMENT='HR';
SELECT * FROM WORKER WHERE JOINING_DATE>'2014-02-20 09:00:00';

-- salary [80000,300000]

SELECT * FROM WORKER WHERE SALARY BETWEEN 80000 AND 300000;

-- SELECTS HR DEPARTMENT WITH SALARY GREATERTHAN OR EQUAL TO 100000
SELECT * FROM WORKER WHERE SALARY>=100000 AND DEPARTMENT='HR';

-- SELECTS ALL HR DEPARTMENT OR AL THE DEPARTMENT WITH SALARY > 200000 
SELECT * FROM WORKER WHERE SALARY>200000 OR DEPARTMENT='HR';

-- SELECTS ALL DEPARTMENT EXCEPT THE HR
SELECT * FROM WORKER WHERE NOT DEPARTMENT='HR';

-- IT SELECTS ALL THE WORKERS WITH DEPARTENT NULL 
SELECT * FROM WORKER WHERE DEPARTMENT IS NULL;

-- like is case insensitive 
-- selects all workers having v at start and l and end of their first name 
SELECT * FROM Worker WHERE FIRST_NAME LIKE 'v%L';
-- all workers having second charachter i and followed wild charcters  
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%';

-- PRINT ALL THE WORKER BY ORDERING THEm into ascending order based on their salary
SELECT * FROM WORKER ORDER BY SALARY;
-- PRINT ALL THE WORKER BY ORDERING THEm into descending order based on their salary
SELECT * FROM WORKER ORDER BY SALARY DESC;


-- print all the distinct department 
select DISTINCT department from worker;

-- GROUP BY is used for grouping so that aggregation operations can be performed on the table
-- IF NO AGGREGATION UNCTION PROVIDED WITH  TH EGROUP BY CLAUSE THEN IT WILL SIMPLY RETURN THE OUTPUT FOR DISTINCT COMMAND
SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT;
-- returns count of all workers in a department
SELECT DEPARTMENT, count(department) FROM WORKER GROUP BY DEPARTMENT;

-- avg salary per department 
SELECT DEPARTMENT, avg(salary) FROM WORKER GROUP BY DEPARTMENT;

-- MIN salary per department 
SELECT DEPARTMENT, MIN(salary) FROM WORKER GROUP BY DEPARTMENT;

-- MAX salary per department 
SELECT DEPARTMENT, MAX(salary) FROM WORKER GROUP BY DEPARTMENT;

-- total salary per department 
SELECT  department, SUM(salary) FROM WORKER GROUP BY DEPARTMENT;

-- having is similar to where but it is used to apply conditons on records after applying the group by clause 
-- returns all the department having avg salary > 150000
SELECT DEPARTMENT, AVG(salary) FROM Worker GROUP BY department having AVG(salary)>=150000;
select department,JOINING_DATE, count(salary) from worker group by  department,JOINING_DATE;
