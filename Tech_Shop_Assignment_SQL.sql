--Inserting 10 values into Customer table 
Insert into Customers values (446,'Anabelle','Andrews','Ana@gmail.com',1236547891,'Canada'),(123,'Ben','Ten','benten@gmail.com',1456123121,'Columbia'),(021,'Tom &','Jerry','TOMMY@gmail.com',1256897496,'North Carolina');
Insert into Customers values (111,'Elsa','Frozen','elsa@gmail.com',213654789,'USA');
Insert into Customers values (100,'Super','Man','superman@gmail.com',14725869,'UK');
Insert into Customers values (450,'Henry','Mathews','henryM@gmail.com',78945869,'North Carolina'),(500,'Elena','Gilbert','ElenaG@gmail.com',7894000,'London');
Insert into Customers values (211,'Stefan','Salvotore','Stefan@gmail.com',20200009,'Times Square'),(220,'Damon','Salvotore','DamonS@gmail.com',22224000,'Paris');
alter table Orders
alter column OrderDate date not null
alter table Customers 
alter column PhoneNumber bigint not null 
select * from Customers
--Inserting 10 values into Orders Table 
Insert into Orders values (10,21,'2023-10-21',10000),(11,100,'2023-10-22',1000) , (12,111,'2023-11-15',20000),(13,123,'2023-11-01',15000),(14,211,'2022-11-20',5000),
(15,220,'2022-11-30',6000),(16,445,'2023-01-11',7500),(17,446,'2022-12-31',20000),(18,450,'2022-12-25',30000),(19,500,'2023-05-21',9000);

select * from Orders;
--Inserting 10 values into Products table 
select * from Products;
Insert into Products values (1001,'samsung mobile','Good Internet Connectivity , GPS Navigation ',50000),(1002,'Lenevo','Display size 14.00-inch,Processor Core i7,RAM 12GB',75000),
(1003,'VU TV','75 inches, QLED TV,4K Resolution,Wifi.',50000),(1004,'One Plus Nord mobile','Good Internet Connectivity , GPS Navigation ',30000),
(1005,'womens-maxi dress','Cotton,pink',500),(1006,'Furniture sofa','smooth and soft , teak wood ',35000),
(1007,'womens-bags-sling','2 compartments , chain handler',2500),(1008,'iPhone 9','An apple mobile which is nothing like apple',45000),
(1009,'perfume Oil','Realaxation',550),(1010,'HP','Good Internet Connectivity , GPS Navigation ',48000);
select * from Products;
--inserting 10 values into orderdetails
select * from OrderDetails;
select * from Orders;
Select * from Products
Insert into OrderDetails values (5000,10,1001,15),(5001,11,1002,30),(5002,12,1003,15),(5003,13,1004,100),(5004,14,1005,550),(5005,15,1006,48),(5006,16,1007,40),(5007,17,1008,60),
(5008,18,1009,500),(5009,19,1010,50);
--inserting values into inventory 
select * from Inventory
alter table Inventory 
alter column QuantityInStock int not null ;
alter table Inventory 
alter column LastStockUpdate date not null ;

Insert into Inventory values (1,1001,20,'2023-03-10'),(2,1002,10,'2023-02-10'),(3,1003,50,'2023-01-10'),(4,1004,70,'2023-03-21'),(5,1005,80,'2023-03-30'),(6,1006,100,'2023-04-10'),
(7,1007,55,'2023-03-15'),(8,1008,85,'2023-08-14'),(9,1009,20,'2023-03-21'),(10,1010,30,'2023-05-16');




---------------DDL AND DML --------------------------

select * from Customers;
select * from Products ;
select * from OrderDetails;
select * from Orders ;
select * from Inventory;

-- Query 1 :-  Write an SQL query to retrieve the names and emails of all customers. 
select FirstName,LastName,Email from Customers ;

-- Query 2 :- Write an SQL query to list all orders with their order dates and corresponding customer names .

select  Orders.OrderDate , Customers.FirstName,Customers.LastName 
from Orders join Customers 
on Orders.CustomerID = Customers.CustomerID;

--Query 3 :- Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
Insert into Customers values (501,'Caroline','Forbes','Caroline@gmail.com',1236547890,'London');
select * from Customers;

--Query 4 :- Write an SQL query to update the prices of all electronic gadgets in the "Products"
--table by increasing them by 10%.
-----Adding seperate column for updated price---
Alter table Products 
Add UpdatedPrice bigint ; 
------Updating Price---
update Products 
set UpdatedPrice = Price * 1.10;
select ProductName , Price , UpdatedPrice from Products ;

--Query 5 :-Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

Declare @OrderIDtodelete INT = 19
Delete from OrderDetails where OrderID=@OrderIDtoDelete 
Delete from Orders where OrderID=@OrderIDtoDelete 
select * from Orders  ;
select * from OrderDetails;

--Query 6 :-Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
select * from Orders;
Insert into Orders values(19,500,'2023-11-28',35000);
select * from Orders ;

--Query 7 :- Write an SQL query to update the contact information (e.g., Phonenumber and address) of a specific 
--customer in the "Customers" table. Allow users to input the customer ID and new contact information.

Declare @CustomerID INT = 500 , @PhoneNumber BIGINT = 3256987410 , @Address varchar(50) = 'Times Square'
Update Customers 
set PhoneNumber = @PhoneNumber , Address=@Address 
where CustomerID=@CustomerID
select * from Customers

--Query 8 :- Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities 
--in the "OrderDetails" table.
select * from Orders 
Select * from OrderDetails
update Orders
set Orders.TotalAmount=OrderDetails.Quantity * TotalAmount
from Orders 
join OrderDetails on OrderDetails.OrderID=Orders.OrderID

select * from Orders

--Query9 :- Write an SQL query to delete all orders and their associated order details for a specific 
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.

Declare @custID int = 111

Delete from OrderDetails where OrderID 
IN (select OrderID from Orders where CustomerID = @custID);--deletes 111 record from orderdetails table 

Delete from Orders where CustomerID=@custID-- deletes 111 record from orders table

select * from Orders
select * from OrderDetails

--Query10 :- Write an SQL query to insert a new electronic gadget product into the "Products" table, 
--including product name, category, price, and any other relevant details.

Insert into Products values (1011,'Water Heater','2L capacity,2 min heating ',2999,2999*1.01);--updated price --> 10% increase on original price.
select * from Products ;

--Query 11 :- Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.

alter table Orders
add status varchar(50) default 'Pending'

update Orders 
set status = 'Pending' where status IS NULL 

Declare @OrderIDToBeUpdated INT = 10 , @statusToBeUpdated varchar(50) = 'Shipped :) '
update Orders
set status = @statusToBeUpdated where OrderID = @OrderIDToBeUpdated

select * from Orders ;

--Query 12 :-Write an SQL query to calculate and update the number of orders placed by each customer 
--in the "Customers" table based on the data in the "Orders" table.

alter table Customers 
add NumberOfOrders INT ;

Update Customers 
SET NumberOfOrders = (
select count(*) from Orders 
where Orders.CustomerID = Customers.CustomerID);

select * from Customers ;


---------------------AGGREGATE FUNCTIONS-------------------------------

--Retrieving all tables and data
select * from Customers;
select * from Products;
select * from Orders;
select * from OrderDetails;
select * from Inventory;

--Aggregate Functions 
---Query 1 :- Write an SQL query to find out which customers have not placed any orders.

select CustomerID,FirstName,LastName,Email,PhoneNumber from Customers where NumberOfOrders = 0;

select * from Customers 
Select * from Orders

select Customers.FirstName , Customers.Email , Customers.PhoneNumber From Customers 
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
Where Orders.OrderID IS NULL

--Query 2 :- Write an SQL query to find the total number of products available for sale. 

select distinct(count(ProductName)) AS TotalNumberOfProductsAvailable from Products;

--Query 3:- Write an SQL query to calculate the total revenue generated by TechShop.

select sum(TotalAmount) AS TOTALREVENUE from Orders;

--Query 4 :- Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.
 
Declare @Category varchar(50) = 'Electronic Gadgets'
select AVG(Quantity) from OrderDetails 
join Products ON OrderDetails.ProductID = Products.ProductID 
where Products.Category = @Category

Declare @Category varchar(50) = 'Womens'
select AVG(Quantity) from OrderDetails 
join Products ON OrderDetails.ProductID = Products.ProductID 
where Products.Category = @Category

select * from OrderDetails

--Query 5 :- Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.

Declare @CustomerID INT = 100
select sum(TotalAmount) AS TotalRevenue from Orders
where CustomerID = @CustomerID;

--Query 6 :- Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.

select TOP 3 Customers.FirstName , COUNT (Orders.OrderID) as OrderCount
From Customers join Orders 
ON Customers.CustomerID = Orders.CustomerID
Group By Customers.CustomerID,Customers.FirstName
Order BY OrderCount DESC


--Query 7 :- Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.
select * from Products
select * from OrderDetails

select Top 1 Products.Category , SUM(OrderDetails.Quantity)  as totalQuantityOrdered
From OrderDetails 
join Products on Products.ProductID = OrderDetails.ProductID
Group By  Products.Category
Order By totalQuantityOrdered DESC 



--Query 8 :- Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. 
-------------List their name and total spending.
select * from Products
select * from Customers
select * from Orders
select * from OrderDetails



select TOP 5 Customers.CustomerID,Customers.FirstName,SUM(TotalAmount) as TotalSpending
From Customers join Orders 
ON Customers.CustomerID=Orders.CustomerID
join OrderDetails 
ON Orders.OrderID = OrderDetails.OrderID
join Products 
ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electronic Gadgets'
GROUP BY Customers.CustomerID,Customers.FirstName
ORDER BY TotalSpending desc


--Query 9 :-  Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.

select Avg(TotalAmount) AS AvgOrderValue from Orders; 

--Query 10:- Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count

select * from Orders
select * from Customers

select Customers.FirstName , COUNT(Orders.OrderID) as OrderCount
From Customers 
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
Group By FirstName
Order By OrderCount DESC

--Here Left join is used instead of join to also print the customernames who havnt ordered anything 
--if join is used the records of customers with 0 orders are not retrieved . 



-----------------------------JOINS------------------------------

--Retrieving all tables data 
select * from Customers
Select * from Products
select * from Orders
Select * from OrderDetails
select * from Inventory


--Query 1:-  Write an SQL query to retrieve a list of all orders along with customer information
--(e.g., customer name) for each order.

select Orders.OrderID, Orders.OrderDate , Customers.FirstName , Customers.PhoneNumber , Customers.Address ,Orders.status 
from Customers 
JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID



--2. Write an SQL query to find the total revenue generated by each electronic gadget product. 
--Include the product name and the total revenue.

SELECT Products.ProductName, Products.Category, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electronic Gadgets'
GROUP BY Products.ProductName, Products.Category

--3. Write an SQL query to list all customers who have made at least one purchase. Include their 
--names and contact information.


select Customers.FirstName , Customers.PhoneNumber, Customers.Email , COUNT(Orders.OrderID) as OrderCount
From Customers 
JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
Group By FirstName , PhoneNumber , Email
Order By OrderCount DESC

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
--total quantity ordered. Include the product name and the total quantity ordered.
select * from Products
select * from OrderDetails

Select TOP 1 Products.ProductName , SUM(OrderDetails.Quantity) as tot_qty_ordered
From Products JOIN OrderDetails
ON Products.ProductID=OrderDetails.ProductID
WHERE Products.Category='Electronic Gadgets'
GROUP BY ProductName
ORDER BY tot_qty_ordered DESC

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
--category.

select Products.ProductName , Products.Description  from Products 
Where Products.Category ='Electronic Gadgets'

--6. Write an SQL query to calculate the average order value for each customer. Include the 
--customer's name and their average order value.
select * from Customers as  C
select * from Orders as O

SELECT  C.FirstName,avg(O.TotalAmount) AS AvgOrderValue
FROM 
CUSTOMERS C  JOIN ORDERS O ON C.CustomerID =O.CustomerID
GROUP BY C.FirstName


--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, 
--customer information, and the total revenue.

select TOP 1 Orders.OrderID , Customers.FirstName , Customers.Email , Customers.PhoneNumber , 
SUM ( OrderDetails.Quantity * Products.Price) AS Tot_Revenue
FROM Orders JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID
join OrderDetails on Orders.OrderID=OrderDetails.OrderID
join Products on OrderDetails.ProductID=Products.ProductID
GROUP BY Orders.OrderID,FirstName,Email,PhoneNumber
ORDER BY Tot_Revenue DESC



--8. Write an SQL query to list electronic gadgets and the number of times each product has been 
--ordered.
select * from Products
select * from Orders

select Products.ProductID,Products.ProductName , count(OrderDetails.OrderID) AS TotOrderCount
From Products LEFT JOIN OrderDetails
ON Products.ProductID = OrderDetails.ProductID
WHERE Products.Category = 'Electronic Gadgets'
GROUP BY Products.ProductID,ProductName

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product. 
--Allow users to input the product name as a parameter.
select * from Customers 
select * from Products  
select * from OrderDetails 
select * from Orders 

Declare @elec_Gadget_Purchased varchar(50) = 'One Plus Nord mobile'

select Customers.FirstName , Products.ProductName , Products.Category from Customers join Orders ON Customers.CustomerID = Orders.CustomerID
join OrderDetails ON OrderDetails.OrderID = Orders.OrderID
join  Products ON Products.ProductID=OrderDetails.ProductID
where Products.ProductName=@elec_Gadget_Purchased
Group by FirstName,ProductName,Category


--10. Write an SQL query to calculate the total revenue generated by all orders placed within a 
--specific time period. Allow users to input the start and end dates as parameters.

Declare @StartDate Date = '2023-06-01'
Declare @EndDate Date = '2023-11-30'

Select SUM(OrderDetails.Quantity * Products.Price) as TotalRevenue
From OrderDetails join Products on OrderDetails.ProductID=Products.ProductID
join Orders on Orders.OrderID=OrderDetails.OrderID
WHERE OrderDate Between @StartDate and @EndDate

select * from Orders
Select * from OrderDetails
select * from Products