--Database Queriesmytabl
/*
CREATE DATABASE db_name;
CREATE DATABASE if NOT EXISTS db_name;

drop DATABASE if EXISTS db_name;
drop DATABASE db_name;

show DATABASEs;
show TABLES;
*/

--Table Related Queries
/*
Create 
SELECT
INSERT INTO db_name VALUES
*/

--Keys
/* 
PRIMARY Key:
			There is only 1
            it should be not null
FOREIGN Key:
			There can be multiple FKs
            Fks can have dublicate and null values        
*/

--Constraints
/*
They are used to specify rules for data in a table
NOT null
UNIQUE
PRIMARY Key
FOREIGN Key
DEFAULT              used to set the default values of a column
CHECK
*/

/*CREATE TABLE mytable(id int PRIMARY KEY,
                    name varchar(50),
                    age int not null);
*/
--drop table demo;
--insert into mytable values(1,'shanif',21);
--insert INto mytable(id,name,age) VALUES(2,'Ali',22),(3,'Adnan',33),(4,'Hussian',22);
--INSERT INTO mytable VALUES(5,'Kazim',44);
--INSERT INTO mytable(id,age) VALUES(6,77);
--drop TABLE if EXISTS student;
create TABLE if not EXISTS emp(id int,age int CHECK(age>=18),name varchar(50),address UNIQUE varchar(50),salary double DEFAULT 25000,
                 id2 int,
                 FOREIGN KEY (id2) references mytable(id),
                 PRIMARY KEY(id,name));     --it makes primary key of combination of id & name 
--INSERT INTO emp VALUES(1,18,'ali','Lahore',30000,1);          

--SELECT * from emp;

--Operators
CREATE TABLE if not EXISTS student(id int PRIMARY KEY,
                    				marks int,
                                  city varchar(10));
/*        
INSERT into student VALUES(1,98,'Lahore');
INSERT into student VALUES(2,08,'Lahore');
INSERT into student VALUES(3,98,'Lahore');
INSERT into student VALUES(4,58,'Fsd');
INSERT into student VALUES(5,18,'Fsd');
INSERT into student VALUES(6,78,'Isl');
INSERT into student VALUES(7,48,'Isl');
INSERT into student VALUES(8,38,'Karachi');
*/
--SELECT * FROM student where marks BETWEEN 70 AND 90;
--select * from student where marks in (8,58);
--select * from student where marks not in (8,58);
--SELECT * from student limit 4;   --shows first 4 rows
--SELECT * from student ORDER BY marks asc;
--SELECT * from student ORDER BY marks DESC;



--Aggregate Functions
--SELECT COUNT(marks) from student;		--shows total number of marks entries
--SELECT MAX(marks) from student;
--SELECT MIN(marks) from student;
--SELECT AVG(marks) from student;
--SELECT SUM(marks) from student;

--GROUP BY
--used with aggregate funstions

--SELECT city FROM student GROUP by city;
--SELECT city,COUNT(id) FROM student GROUP by city;     --shows number of students in each city
--SELECT city,AVG(marks) FROM student GROUP by city;     --shows average of marks of students in each city

--HAVING fUNCTIONE 
--same as where function which used with group by functions bcz Where can't used with 
--group by functions.

--SELECT city,max(marks) FROM student GROUP by city HAVING marks>70;
--SELECT * from student;

--General order of functions 
/*
SELECT
FROM
WHERE
GROUP by 
HAVING
ORDER BY
*/

--SELECT * FROM student WHERE marks>=50 GROUP by city HAVING marks>=80 order by marks asc;


--table related Queries 
/*
update student set city='Isl' where marks=8;
UPDATE student set marks=30+6 where marks>10;
DELETE FROM student where marks<30;
SELECT * from student;


--FK 
CREATE TABLE if not exists club(id int PRIMARY KEY,
                   name  varchar(20));

CREATE TABLE player(id int PRIMARY KEY,
                   name varchar(10),
                   club_id int not null,
                   foreign key (club_id) references club(id))
                                       
SELECT * from player;
*/
                  

--CASCADE
/*
ON UPDATE CASCADE:
				  updates in the parent table 's primary key will also updates in the child table 's foreign key
ON DELETE CASCADE:
				  deletes in the parent table 's primary key will also deletes in the child table 's foreign key                  
*/
create table if not exists parent(id int primary key);
--insert into parent values(1),(2),(3),(4),(5);
create table if not exists child(id int primary key,
                   name varchar(10),
                    id_no int,
                    foreign key (id_no) references parent(id)
                                  on update cascade
                                 on delete cascade);
--insert into child values(100,'shanif',1),(101,'shanif',2),(102,'shanif',3),(103,'shanif',4),(104,'shanif',5);

--update parent set id=7 where id=4;
--delete from parent where id=1;
--select * from child;
--Note:
		--this cascade 's program is correct but cascade doesn't work here, Try other sql editor fro this like Programiz 
        
        
--Table Related Queries 

--1)Add Column
--ALTER TABLE child add column address varchar(20);
--2)Delete Column
--alter table child drop column address;
--3)Rename Table 
--alter table emp rename to empoyees;
--4)Rename Column 
--ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;
--5)Modify Column (modify datatype/constraints)
--Syntax:
--alter table table_name MODIFY col_name new_datatype new_constraint      --not supported here
--6)Change Column (Rename column)
--Syntax:
--alter table table_name change old_name new_name new_datatype new_constraint    --not supported here
--7)Truncate table (deletes table'data,deletes not a table as drop table )
--Syntax:
--TRUNCATE table_name;
     
     
--Joins      

create table if not exists studentData(id int PRIMARY key,name varchar(10));
CREATE table if not exists course(id int PRIMARY key,course varchar(10));

--insert into studentData values(101,'ali'),(102,'hassan'),(103,'yousuf');
--insert into course values(102,'math'),(105,'science'),(103,'computer'),(107,'physics');

--1)Inner Join:
				--combine similar data based on related column between tables
                --when we use join By default it consider as inner join   
/*                
SELECT *
from studentData as s
INNER JOIN course as c
on s.id=c.id;
*/

--2)Left Join or Left Outer Join:
				--combines table no 1'data and similar data based on related column between tables
/*                
SELECT *
from studentData as s
LEFT JOIN course as c
on s.id=c.id;
*/


--3)Right Join or Right Outer Join:
				--combines table no 2'data and similar data based on related column between tables
/*                
SELECT *
from studentData as s
RIGHT JOIN course as c
on s.id=c.id;
*/
  
  
--4)Full Join or Full Outer Join:
				--combines table no 1'data and table no 2'data and similar data based on related column between tables
--Syntax:
/*
Left Join 
Union 
Right Join
*/

/*
SELECT *
from studentData as s
LEFT JOIN course as c
on s.id=c.id
UNION
SELECT *
from studentData as s
RIGHT join course as c
on s.id=c.id;
*/


--5)Left Exclusive Join:
				--includes only non similar data of table no 1
/*                
SELECT *
from studentData as a
LEFT JOIN course as b
on a.id=b.id
where b.id is null;
*/

--6)Right Exclusive Join:
				--includes only non similar data of table no 2
/*                
SELECT *
from studentData as a
RIGHT JOIN course as b
on a.id=b.id
where a.id is null;
*/

--7)Self Join:
			 --A self join is a regular join, but the table is joined with itself.

CREATE table if not exists employee(id int primary key,
                                   name varchar(10),
                                   manager_id int);
--insert into employee values(101,'bob',103),(102,'adam',104),(103,'casey',null),(104,'donald',103);
/*
SELECT a.name,b.name as manager_id
from employee as a
join employee as b
where a.id=b.manager_id;

SELECT * from employee;
*/


--8)Union 
/*
he UNION operator is used to combine the result-set of two or more SELECT statements.
Gives unique records.
Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order
*/

/*
SELECT name from employee
UNION 
SELECT name from employee;
*/


--9)Union All:
			  --Same as union but allow duplicates
/*              
SELECT name from employee
union all 
select name from employee;
*/


--Subqueries OR inner queries OR Nested queries
--Query within another query 
--Techniques for subqueries 
/*
1)SELECT
2)FROM
3)WHERE
*/

create table if not exists Result(rollno, name, marks, grade, city);
/*
INSERT INTO Result VALUES
(101, 'anil', 78, 'C', 'Pune'),
(102, 'bhumika', 93, 'A', 'Mumbai'),
(103, 'chetan', 85, 'B', 'Mumbai'),
(104, 'dhruv', 96, 'A', 'Delhi'),
(105, 'emanuel', 92, 'F', 'Delhi'),
(106, 'farah', 82, 'B', 'Delhi');
*/
--select * from Result;

--Q: give all names which have marks more than average of all marks
/*
select name,marks
from Result
where marks >(SELECT avg(marks) from Result);
*/

--Q: gives names of students with even roll no 
/*
select name,rollno
from Result
where rollno in (SELECT rollno from Result where rollno%2=0);
*/

--Q: Find the max marks from the students of delhi 
/*
select max(marks)
from (SELECT * from Result WHERE city ='Delhi') as tempmarks;
*/

--Example with select 
/*
SELECT (SELECT max(marks) from Result)
from Result;
*/

--Views
/*
virtual table (not a real table) derived from actual or real table 
any updates in the real table will also reflect in the virtual table 
Some operations like select and drop will not modify the real table when we perform these on virtual table 
But some operations like insert,delete,update will modify real table.
*/

CREATE view if not EXISTS view1 AS
SELECT rollno,name,marks 
from Result;


--SELECT * from view1;
--SELECT max(marks) from view1;
SELECT * from view1 WHERE marks>90;
--drop view view1;