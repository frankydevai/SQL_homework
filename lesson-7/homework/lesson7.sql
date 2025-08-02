----1 Write a query to find the minimum (MIN) price of a product in the Products table.
select min(price) as minimumprice from  products  
----2.Write a query to find the maximum (MAX) Salary from the Employees table. 
select max(salary) as maxsalary from employees

--- 3 Write a query to count the number of rows in the Customers table.
select count(customerID) numberofrows from customers
---4 Write a query to count the number of unique product categories from the Products table.
select  count(distinct category) from products 
---5 Write a query to find the total sales amount for the product with id 7 in the Sales table.

select sum(saleamount) as total_sales_amount from sales where productid = 7

 --- 6. Write a query to calculate the average age of employees in the Employees table.
 select avg(age) as avarage_age from employees 

 ---7  Write a query to count the number of employees in each department.

 select count(employeeid) as number_of_employees, departmentName from employees group by departmentName

 --- 8 Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.

 select  min(price) as minimum_price , max(price) as maximum_price, category from products group by category
 --- 9 Write a query to calculate the total sales per Customer in the Sales table.

 select  customerid , sum(saleamount) as total_sales from sales group by customerid 

/*.
 10. Write a query to filter departments having more than 5 employees from the Employees table.
(DeptID is enough, if you don't have DeptName).
*/

select count(EmployeeID), departmentname from Employees 
group by departmentname
Having count(EmployeeID) > 5

/*
🟠 Medium-Level Tasks (9)
*/

---11 Write a query to calculate the total sales and average sales for each product category from the Sales table

select productid, sum(saleamount) as totalsales, avg(saleamount) as avaragesales from sales group by productid

--- 12 Write a query to count the number of employees from the Department HR.

select count(employeeid) from employees where departmentname = 'hr'
--- 13.Write a query that finds the highest and lowest Salary by department in the Employees table.
--- (DeptID is enough, if you don't have DeptName).
select  max(salary) as highest_salary, min(salary) as minimum_salary, departmentname from employees 
group by departmentname
--- 14.Write a query to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).

select avg(salary) as avarage_salary, departmentname from employees
group by departmentname

--- 15 Write a query to show the AVG salary and COUNT(*) of employees working in each department.
--- (DeptID is enough, if you don't have DeptName).

select avg(salary) avarage_salary, count(EmployeeID) number_of_employees, departmentname from employees
group by departmentname
---16 Write a query to filter product categories with an average price greater than 400.
select avg(price), category from products 
group by category
having avg(price) > 400
--- 17 Write a query that calculates the total sales for each year in the Sales table.
select sum(saleamount), year(saledate) from sales
group by year(saledate)

--- 18 Write a query to show the list of customers who placed at least 3 orders.
select count(customerid) from sales group by customerid 
having count(customerid) > 3
--- 19 Write a query to filter out Departments with average salary expenses greater than 60000.
--- (DeptID is enough, if you don't have DeptName).

select avg(salary) as avarage_salary, departmentname from employees
group by departmentname
having  avg(salary) > 60000

----------------🔴 Hard-Level Tasks (6) ----------------------------------
----- 20 Write a query that shows the average price for each product category, and then 
---- filter categories with an average price greater than 150.
select avg(price), category from products 
group by category 
having avg(price) > 150 

---21 Write a query to calculate the total sales for each Customer, 
-- then filter the results to include only Customers with total sales over 1500.
select sum(saleamount) as totalsales , customerid from sales
group by customerid 
having sum(saleamount) > 1500
-- 22 Write a query to find the total and average salary of employees in each department, 
-- and filter the output to include only departments with an average salary greater than 65000.
select sum(salary) as totalsalary, avg(salary) as avaragesalary, departmentname from employees 
group by departmentname
having avg(salary) > 65000
--- 23 Write a query to find total amount for the orders
---which weights more than $50 for each customer along with their least purchases.
---(least amount might be lower than 50, use tsql2012.sales.orders table,freight col, 
-- ask ur assistant to give the TSQL2012 database).
select  sum(totalamount) as totalamount, customerid from orders 
group by customerid
having totalamount > 50
--24 .Write a query that calculates the total sales and counts unique products sold in each month of each year, 
--and then filter the months with at least 2 products sold.(Orders)
select sum(saleamount) as total_sales, count(distinct productid), month(saledate ),  year(saledate)from sales
group by month(saledate ),  year(saledate)
having count(distinct productid) > 2

--25 Write a query to find the MIN and MAX order quantity per Year. From orders table. Necessary tables:
select  min(quantity) as minimumorder, max(quantity) as maximumorder, year(orderdate) from orders
group by year(orderdate)

