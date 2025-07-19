create database homework 

Use homework
--- ### **Basic-Level Tasks (10)**  
----- Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).

Create table employees (EmpID int, Name Varchar(50), Salary Decimal(10,2))
---- 2. Insert three records into the `Employees` table using different INSERT INTO approaches (single-row insert and multiple-row insert).  

Insert INto employees  select 1, 'Jasur', 800000.25, null

insert into employees (EmpID, Name, Salary) Values (2, 'Frank', 1580000.50), (3, 'Duke', 586253.15)

---- 3. Update the `Salary` of an employee to `7000` where `EmpID = 1`.

update Employees Set Salary = 7000 where EmpID=1

---- 4. Delete a record from the `Employees` table where `EmpID = 2`.  
Delete from employees where EmpID=2

Select * from employees

---- 5. Give a brief definition for difference between `DELETE`, `TRUNCATE`, and `DROP`.
/*
We use DELETE when we want to delete specific rows from a table using a WHERE clause.

We use TRUNCATE when we want to delete all data from a table quickly, but keep the table structure.

We use DROP when we want to completely remove a table or database, including its structure and all data.

*/
-----  6. Modify the `Name` column in the `Employees` table to `VARCHAR(100)`.  

Alter table Employees alter column Name varchar(100) 

----- 7. Add a new column `Department` (`VARCHAR(50)`) to the `Employees` table.  

Alter table employees add Department Varchar(50)

---- 8. Change the data type of the `Salary` column to `FLOAT`.

Alter table employees alter column Salary Float

--- 9. Create another table `Departments` with columns `DepartmentID` (INT, PRIMARY KEY) and `DepartmentName` (VARCHAR(50)).  

Create table Departments(DepartmentID INT, DepartmentName VARCHAR(50), PRIMARY KEY (DepartmentID))

 --- 10. Remove all records from the `Employees` table without deleting its structure. 
 
 Truncate table Employees 


 --- ### **Intermediate-Level Tasks (6)**  
--- 11. Insert five records into the `Departments` table using `INSERT INTO SELECT` method(you can write anything you want as data).  
	insert into departments select 1, 'Sales' 
							union all 
							select 2, 'Finance' 
							union all  
							select 3, 'Accounting'
							union all 
							select 4, 'HR'
							union all 
							select 5, 'Productio'

select * from Departments

-- 12. Update the `Department` of all employees where `Salary > 5000` to 'Management'. 
Select * from employees

update Employees Set Department = 'Management' where salary > 5000

--- 13. Write a query that removes all employees but keeps the table structure intact.   
TRUNCATE TABLE Employees;

----14. Drop the `Department` column from the `Employees` table. 

Alter table Employees drop column Department

--- 15. Rename the `Employees` table to `StaffMembers` using SQL commands.  
EXEC sp_rename 'Employees', 'StaffMembers';

Select * from  Staffmembers 

--- 16. Write a query to completely remove the `Departments` table from the database.  

Drop table Departments  

----- ### **Advanced-Level Tasks (9)**        
--- 17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
INSERT INTO Products
VALUES
(1, 'Wireless Mouse', 'Electronics', 19.99, 150),
(2, 'Water Bottle', 'Home & Kitchen', 9.50, 300),
(3, 'Notebook', 'Stationery', 2.25, 500),
(4, 'T-Shirt', 'Apparel', 14.99, 200),
(5, 'Headphones', 'Electronics', 49.95, 80);

--- 18. Add a CHECK constraint to ensure Price is always greater than 0.
alter table products add check ( price >0)

---19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.

alter table products ADD CONSTRAINT  Stockquantity  Default  50 for Stockquantity
--- 20. Rename Category to ProductCategory

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';


--- 21. Insert 5 records into the Products table using standard INSERT INTO queries.
INSERT INTO Products
VALUES
(1, 'Wireless Mouse', 'Electronics', 19.99, 150),
(2, 'Water Bottle', 'Home & Kitchen', 9.50, 300),
(3, 'Notebook', 'Stationery', 2.25, 500),
(4, 'T-Shirt', 'Apparel', 14.99, 200),
(5, 'Headphones', 'Electronics', 49.95, 80);

-- 22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.

Select * into Products_Backup from Products
---- 23. Rename the Products table to Inventory.
exec sp_rename 'Products',  'Inventory'
---- 24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
select * from inventory
Alter table inventory ALTER COLUMN Price float

--- 25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to `Inventory` table.





