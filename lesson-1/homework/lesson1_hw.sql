create Database homework

use homework 

Create table family (Family_id int, Name varchar(20), Number int, birthdate date)

----#1st way 
Insert into family values (1, 'Frank', 998388583, 03/18/2000)

--- #2nd way 

Insert into family (Family_id, Name, birthdate) values (2, Laura, 01/02/2004)

--- #3rd way 

insert into  family
select 3, 'Alex', 774558989, 12/11/2004 

----#4th way 

Select * into Family2 from family

------------------------------------------------------------------------------------------


Create table Student (student_id int, Student_Name varchar(20), Student_Number int, birthdate date, Student_gpa decimal)

----#1st way 
Insert into student values (1, 'Mike', 998388583, 04/12/2005, 4.5)

--- #2nd way 

Insert into student (student_id, Student_Name, Student_gpa) values (2,'Sophia', 4.0)

--- #3rd way 

insert into  student
select 3, 'John', 774558989, 12/15/2007, 4.2 

----#4th way 

Select * into studnet2 from student


------------------------------------------------------------------------------------------


Create table employee (employee_id int, Employee_Name varchar(20), Employee_Number int, birthdate date, Employee_department Varchar(20), Employee_Salary int)

----#1st way 
Insert into employee values (1, 'Adam', 998301583, 10/11/2000, 'Finance', 5000000)

--- #2nd way 

Insert into employee (employee_id, employee_Name, employee_Salary) values (2,'Sophia', 7000000)

--- #3rd way 

insert into  employee
select 3, 'Simon', null, 12/15/2007, 'HR', null 

----#4th way 

Select * into employee2 from employee

------------------------------------------------------------------------------------------


Create table friends (friends_id int, Friends_Name varchar(20),  Friends_country Varchar(20))

----#1st way 
Insert into friends values (1, 'Nick',  'USA')

--- #2nd way 

Insert into friends (Friends_id, friends_Name) values (2,'Phlip')

--- #3rd way 

insert into  friends
select 3, 'Jasur', 'Uzbekistan'

----#4th way 

Select * into friends2 from friends

------------------------------------------------------------------------------------------


Create table Countries (Countries_id int, Countries_Name varchar(20),  Countries_Population int, Countries_GDP decimal)

----#1st way 
Insert into Countries values (1, 'Uzbekistan',  38000000, null)

--- #2nd way 

Insert into countries (countries_id, Countries_Name, Countries_GDP) values (2,'Kazakhistan',  300.54)

--- #3rd way 

insert into  countries
select 3, 'Italia', 59000000, 2.42 

----#4th way 

Select * into countries2 from countries

