
create database hw8
use hw8

/*
Easy-Level Tasks
Using Products table, find the total number of products available in each category.
Using Products table, get the average price of products in the 'Electronics' category.
Using Customers table, list all customers from cities that start with 'L'.
Using Products table, get all product names that end with 'er'.
Using Customers table, list all customers from countries ending in 'A'.
Using Products table, show the highest price among all products.
Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
Using Customers table, find the total number of customers in each country.
Using Orders table, find the minimum and maximum quantity ordered.
*/
--- 1 Using Products table, find the total number of products available in each category
select sum(productid), category from products group by category
--- 2  Using Products table, get the average price of products in the 'Electronics' category.
select avg(price) from products where category = 'Electronics'

---- 3 Using Customers table, list all customers from cities that start with 'L'.

Select * from customers where city like 'L%'

--- 4 Using Products table, get all product names that end with 'er'.

Select Productname from products where productname like '%er' 

--  5   Using Customers table, list all customers from countries ending in 'A'.

Select * from customers where country like '%A'
--- 6  Using Products table, show the highest price among all products.

select max(price) from products 

--- 7 Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
select *, 
  case
		when StockQuantity <30  then  'Low Stock' 
		else 'Sufficient'
  end 

from products 

---- 8 Using Customers table, find the total number of customers in each country.
select sum(customerid), country from customers
group by Country
--- 9 Using Orders table, find the minimum and maximum quantity ordered.

select  min(quantity) minimum, max(quantity) maximum from orders

/*
Medium-Level Tasks
Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
Using Orders table, find the average order amount by year.
Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.
Using Sales table, find total sales per product Id.
Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy results to a new Population_Each_City table.
*/
--10 Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.

select * from orders as o
left join invoices as i on  o.customerid = i.customerid  and year(i.invoicedate) = 2023  
	where year(o.orderdate) = 2023 and month(o.orderdate) = 1 and i.customerid is  null

--- 11 Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
select  productname  from products 
	union all
 select productname from products_discounted


--- 12 Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
select  productname from products
union 
select productname from products_discounted

---13 Using Orders table, find the average order amount by year.

select * from orders
select avg(totalamount) averageamount, orderdate from orders 
group by year(orderdate)

--- 14 Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
select Productname , price,
case 
	when price < 100 then 'low' 
    when price between 100 and 500 then 'Mid' 
    when price >500 then 'high'
	
	end 
from products

--- 15 Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.

select district_name, [2012], [2013]  into   Population_Each_Year
from City_Population
Pivot (
	sum(population)
	for year in ([2012], [2013]) 
	) as p

---- 16 Using Sales table, find total sales per product Id.

select * from sales

select productid, sum(saleamount) as totalsales  from sales 
group by ProductID

--- 17 Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.

select  * from products

Select productname from products where productname like '%oo%'

-- 18 Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy results to a new Population_Each_City table.

select year, [Bektemir], [Chilonzor], [Yakkasaroy] 
into Population_Each_City
from city_population
pivot
	(
	sum(population)
 
	for district_name in ([Bektemir], [Chilonzor], [Yakkasaroy] )
	) as p 
