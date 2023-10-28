USE temp;
CREATE TABLE mystudent(
id INT PRIMARY KEY,
name VARCHAR(20),
email varchar(25)
);

create TABLE COURSES(
	C_ID INT PRIMARY KEY,
    NAME VARCHAR(25),
    stud_id int,
    FOREIGN KEY(STUD_ID) REFERENCES MYSTUDENT(id)
    ON UPDATE CASCADE ON delete set null
);

alter table mystudent add age int;
-- inserting ingle value at a time with all the fields available 
insert into mystudent values
(1,'abhishek','abhi@gmail.com',18);

-- single value at a time with all fields not available 
-- unavailable fields will be marked with default values if given otherwise will be marked null
insert into mystudent (id,name) values
(2,'alokit');

-- inserting multiple rows at a time with all fields available
insert into mystudent (id,name,email) values
(3,'ankita','ankita@gmail.com'),
(4,'udit','udit@gmail.com'),
(5,'vikas','vikas@gmail.com'),
(6,'asit','asit@gmail.com');


-- inserting multile rows with some data unavailable
insert into mystudent (id,name) values
(7,'suraj'),
(8,'binu');

select * from mystudent ;
-- update 
UPDATE mystudent set name = 'abhi', email = 'binu@gmail.com' where id = 8;

-- by default sql does not allow us to update all the rows i.e use update without where query as it is in safe mode therefore to apply update on all the row we need to first 
-- set system variable SQL_SAFE_UPDATES to 0
set SQL_SAFE_UPDATES = 1;

-- update all the rows 
update mystudent set age = 18;
update mystudent set age = age+3;


-- delete command 
-- delete a single row or multiple rows based on the condition 
delete from mystudent where id = 5;

-- delete all the records from the table;
delete from mystudent;


    
insert into courses (c_id,name,stud_id) values
(1,'computers',1),
(2,'hindi',1);
select * from courses;

-- IF ON delete cascade is used in the foreign key constraint thane it will delete complete row corresponding to the key from both the tables 
-- when on delete null is used while declaring foreign key then on deleteikn of the row from parent table it will set te foreign key to null in the child table
delete from mystudent where id=1;
-- data from table 1 willb only removed if first it is removed from the child table here courses 
truncate courses;
delete from courses where c_id =1;


-- replace command replaces already existing values otherwise inserts new values 
replace into mystudent(id,name,email,age)
values (1,'abhi','abhis@gmail.com', 21);
select * from mystudent;
-- in all the replace statement it updates fields that are mentioned and no other fieldds a re updated
replace into mystudent set id = 3,name='ankita', email = 'ankita@gmail.com';
replace into mystudent set id = 10,name='abhi', email = 'abhi@gmail.com' ;

replace into mystudent (id,name)
select id,name from mystudent where id = 1; 

delete from mystudent where id = 11;
update mystudent set id = 11 where id = 1;
alter table courses add constraint fk_Std_id1  FOREIGN KEY(STUD_ID) REFERENCES MYSTUDENT(id)
    on update cascade  ;
    desc courses;