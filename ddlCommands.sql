create database temp;
USe temp;

CREATE TABLE Customer(
	id integer PRIMARY KEY,
	cname varchar (225),
    age int ,
    salary int default 10001,
    email varchar(50) UNIQUE,
    constraint eligible check (age>18 and salary>10000) 
	);
-- if datatype is int and float value is inserted then it is rounded off
-- it would not allow to insert data for age <=18 
insert into customer(id,cname,age,email) values
(1,'b',20,'a@gmail.com');
insert into customer(id,cname,email) values
(2,'b',null);
insert into customer(id,cname,email) values
(4,'c',null);
select * from customer;


drop table customer;
CREATE TABLE Order_details(
	Order_id integer PRIMARY KEY,
	delivery_date DATE,
	cust_id INT,	
	FOREIGN KEY (cust_id) references Customer(id));
drop table Order_details;

use temp;
create table account(
id int primary key,
name char(25),
balance float);

-- describe/desc is used to show the current structure of schema
describe account;

-- adds new column email to table account
alter table account 
add email varchar(30);  

-- modify the data type of the column name from char to varchar
alter table account 
modify name varchar(30);

-- change the column name from name to customer_name
alter table account 
change name customer_name varchar(30);

-- modifies the column balance and also adds a new constraint to the column
alter table account 
modify balance decimal default 0;

-- adds constraint tp check if the email contains @ and .com in the email
alter table account 
modify email varchar(30) check (email like '%@%.com'); 

insert into account (id,customer_name,balance,email) values
(1,'abhi', 100,'a@ga.com');
select * from account;

-- renamed the table from account to customer account
alter table account RENAME TO customer_account;
 desc customer_account;
 -- deletes a column from the table
alter table customer_account 
drop email;

alter table customer_account modify balance double default 100;

alter table customer_account 
drop  column customer_name; 

alter table customer_account
add email varchar(25),
add cname varchar(25);