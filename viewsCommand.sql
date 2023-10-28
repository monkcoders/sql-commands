-- views in My sql 
-- views create a template so that different users can have different views of the database 
-- it implements isolation 

use org;

SHOW TABLES;
SHOW DATABASES;
USE JOINEXAMPLE;
SHOW TABLES;

SELECT * FROM EMPLOYEE;

-- syntax for defining a view 
CREATE VIEW myView As select fname,email,age from employee;

-- using this view 
select * from myView;

select fname from myView;

-- modifying/altering the view 
alter view myView as SElect fname,lname,age,email from employee;

-- deleting a view 
drop view myView;


-- create a view that show data by joining employee, project and clients table 
create view alldata as select e.fname,e.lname, e.age,e.email,e.phoneNo,e.city, p.name,p.startDate,c.fname as clientfname,c.lname as clname, c.age as cage,c.email as cemail,c.phoneNo as cphoneNO,c.city as cCity from employee as e
INNER JOIN project as p ON e.id = p.empId
Inner JOIN client as c ON p.clientId = c.id;

select * from alldata;

select fname,clientfname, city,cCity from allData where city='Jaipur' and ccity='Hyderabad';