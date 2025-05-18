Drop table if exists Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

Drop table if exists Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

Drop table if exists OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

Drop table if exists Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);


INSERT INTO Customers VALUES 
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO Orders VALUES 
(101, 1, '2024-01-01'), (102, 1, '2024-02-15'),
(103, 2, '2024-03-10'), (104, 2, '2024-04-20');

INSERT INTO OrderDetails VALUES 
(1, 101, 1, 2, 10.00), (2, 101, 2, 1, 20.00),
(3, 102, 1, 3, 10.00), (4, 103, 3, 5, 15.00),
(5, 104, 1, 1, 10.00), (6, 104, 2, 2, 20.00);

INSERT INTO Products VALUES 
(1, 'Laptop', 'Electronics'), 
(2, 'Mouse', 'Electronics'),
(3, 'Book', 'Stationery');


--#### **1️ Retrieve All Customers With Their Orders (Include Customers Without Orders)**
--- Use an appropriate `JOIN` to list all customers, their order IDs, and order dates.
--- Ensure that customers with no orders still appear.
select 
c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate 
from Customers as c
left join Orders as o
	on c.CustomerID = o.CustomerID


--#### **2️ Find Customers Who Have Never Placed an Order**
--- Return customers who have no orders.
select 
c.CustomerID, c.CustomerName
from Customers as c
left join Orders as o
	on c.CustomerID = o.CustomerID
where o.CustomerID is Null


--#### **3️ List All Orders With Their Products**
--- Show each order with its product names and quantity.
select 
od.OrderDetailID, od.OrderID, od.ProductID, p.ProductName, od.Quantity
from OrderDetails as od
join Products as p
	on od.ProductID = p.ProductID


--#### **4️ Find Customers With More Than One Order**
--- List customers who have placed more than one order.
select 
c.CustomerID, c.CustomerName, count(o.OrderID) OrderCount
from Customers as c
left join Orders as o
	on c.CustomerID = o.CustomerID
Group by c.CustomerID, c.CustomerName
Having count(o.OrderID) > 1


--#### **5️ Find the Most Expensive Product in Each Order**
select 
od.OrderID, od.ProductID, od.Price, p.ProductName
from OrderDetails as od
join Products as p
	on od.ProductID = p.ProductID
where od.Price = (
	select max(Price)
	from OrderDetails
	where od.OrderID = OrderID
)


--#### **6️ Find the Latest Order for Each Customer**
select 
c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate 
from Customers as c
join Orders as o
	on c.CustomerID = o.CustomerID
where o.OrderDate = (
	select max(OrderDate)
	from Orders
	where c.CustomerID = CustomerID
)

--#### **7️ Find Customers Who Ordered Only 'Electronics' Products**
--- List customers who **only** purchased items from the 'Electronics' category.
select 
c.CustomerID, c.CustomerName
from Customers as c
join Orders as o
	on c.CustomerID = o.CustomerID
join OrderDetails as od
	on o.OrderID = od.OrderID
join Products as p
	ON od.ProductID = p.ProductID
group by c.CustomerID, c.CustomerName
having count(Distinct p.Category) = 1 and
max(p.Category) = 'Electronics'


--#### **8️ Find Customers Who Ordered at Least One 'Stationery' Product**
--- List customers who have purchased at least one product from the 'Stationery' category.
select 
c.CustomerID, c.CustomerName, p.ProductName, p.Category
from Customers as c
join Orders as o
	on c.CustomerID = o.CustomerID
join OrderDetails as od
	on o.OrderID = od.OrderID
join Products as p
	ON od.ProductID = p.ProductID
where p.Category = 'Stationery'


--#### **9️ Find Total Amount Spent by Each Customer**
--- Show `CustomerID`, `CustomerName`, and `TotalSpent`.
select 
c.CustomerID, c.CustomerName, 
sum(od.Price * od.Quantity) TotalSpent
from Customers as c
join Orders as o
	on c.CustomerID = o.CustomerID
join OrderDetails as od
	on o.OrderID = od.OrderID
Group by c.CustomerID, c.CustomerName