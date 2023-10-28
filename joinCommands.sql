-- learing joins 
create database joinExample;
use joinExample;

create table employee(
id int primary key,
fname varchar(25),
lname varchar(25),
email varchar(100),
age int,
phoneNo int,
city varchar(25)
);

create table client(
id int primary key,
fname varchar(25),
lname varchar(25),
email varchar(100),
age int,
phoneNo int,
city varchar(25),
empId int,
foreign key(empId) references employee(id) 
ON Update cascade 
ON delete cascade
);


create table project(
id int primary key,
empId int,
name varchar(25),
startDate date,
clientId int,
foreign key(empId) references employee(id) ON Update cascade 
ON delete cascade ,
foreign key(clientId) references client(id) ON Update cascade 
ON delete cascade
);

INsert Into employee (id,fname ,lname ,age, email ,phoneNo ,city) values
(1, 'Aman', 'Proto',32, 'aman@gmail.com',898, 'Delhi'),
(2, 'Yagya', 'Narayan',44, 'yagya@gmail.com',222, 'Palam'),
(3, 'Rahul', 'BD',22, 'rahul@gmail.com',444, 'Kolkata'),
(4, 'Jatin', 'Hermit',31, 'jatin@gmail.com',666, 'Raipur'),
(5, 'PK', 'Pandey',21, 'pk@gmail.com',555, 'Jaipur');



INSERT INTO client (id,fname ,lname ,age, email ,phoneNo ,city,empId) values
(1, 'Mac', 'Rogers',47, 'mac@hotmail.com',333, 'Kolkata',3),
(2, 'Max', 'Poirier',27, 'max@gmail.com',222, 'Kolkata',3),
(3, 'Peter', 'Jain',24, 'peter@abc.com',111, 'Delhi',1),
(4, 'Sushant', 'Aggarwal',23, 'sushant@yahoo.com',45454, 'Hyderabad',5),
(5, 'Pratap', 'Singh',36, 'p@xyz.com',77767, 'Mumbai',2);

update client set empId =2 where id = 1;
update client set empId =3 where id = 5;


Insert Into Project (id,empId,name,startDate,clientId) values
(1,1,'A','2021-04-21',3),
(2,2,'B','2021-03-12',1),
(3,3,'C','2021-01-16',5),
(4,3,'D','2021-04-27',2),
(5,5,'E','2021-05-01',4);


-- INNER JOIN
-- Enlist all the employees ID's, names along with the Project allocated to them.
select e.id,e.fname,e.lname,p.name from employee as e 
INNER JOIN project as p ON e.id=p.empId;
-- join keyword also performs inner join
select e.id,e.fname,e.lname,p.name from employee as e 
JOIN project as p ON e.id=p.empId;


-- Fetch out all the employee ID's and their contact detail who have been working
-- from Jaipur with the clients name working in Hyderabad.
select e.id,e.fname,e.lname,e.email,e.phoneNo, c.fname, c.lname from employee as e 
Inner Join client as c ON e.id=c.empId where e.city='Jaipur' and c.city='Hyderabad';

select e.id,e.fname,e.lname,e.email,e.phoneNo, c.fname, c.lname from employee as e 
Join client as c ON e.id=c.empId where e.city='Jaipur' and c.city='Hyderabad';

-- LEFT JOIN
-- Fetch out each project allocated to each employee.
select e.*, p.* from employee as e 
Left Join project as p On e.id = p.empId;
-- both are same i.e printing all coumns using indiviudal table with astric (*) or directly using *
select * from employee as e 
Left Join project as p On e.id = p.empId;

-- RIGHT JOIN
-- List out all the projects along with the employee's name and their respective allocated email ID.
select p.id,p.name,e.fname,e.lname,e.email from employee as e
Right Join project as p On e.id= p.empId;


-- CROSS JOIN
-- List out all the combinations possible for the employee's name and projects that can exist.
select e.fname,lname, p.* from employee as e
cross Join project as p ;


-- join all the 3 tables and show the data 
select * from employee as e 
Inner Join project as p On e.id=p.empId
Inner Join client as c On p.clientId = c.id;

select * from employee as e 
Inner Join project as p On e.id=p.empId 
Inner Join client as c On e.id= c.empId and p.clientId = c.id;

-- we can always write a join command alternatively using a select query or subquery 
-- joining two tables without using join 
select e.*,p.* from employee as e, project as p
where e.id = p.empId;

-- joining 3 tables w/o joins 
select e.*,p.*, c.* from employee as e, project as p,client as c
where e.id = p.empId and p.clientId = c.id;
