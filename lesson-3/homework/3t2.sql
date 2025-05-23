--Task 2: Customer Order Insights
--Write an SQL query that:

 --Selects customers who placed orders between '2023-01-01' and '2023-12-31'.
 --Includes a new column OrderStatus that returns:
	--'Completed' for Shipped or Delivered orders.
	--'Pending' for Pending orders.
	--'Cancelled' for Cancelled orders.
 --Groups by OrderStatus and finds the total number of orders and total revenue.
 --Filters only statuses where revenue is greater than 5000.
 --Orders by TotalRevenue descending.

 DROP TABLE IF EXISTS Orders
 CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);


INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status)
VALUES 
    (101, 'John Doe', '2023-01-15', 2500, 'Shipped'),
    (102, 'Mary Smith', '2023-02-10', 4500, 'Pending'),
    (103, 'James Brown', '2023-03-25', 6200, 'Delivered'),
    (104, 'Patricia Davis', '2023-05-05', 1800, 'Cancelled'),
    (105, 'Michael Wilson', '2023-06-14', 7500, 'Shipped'),
    (106, 'Elizabeth Garcia', '2023-07-20', 9000, 'Delivered'),
    (107, 'David Martinez', '2023-08-02', 1300, 'Pending'),
    (108, 'Susan Clark', '2023-09-12', 5600, 'Shipped'),
    (109, 'Robert Lewis', '2023-10-30', 4100, 'Cancelled'),
    (110, 'Emily Walker', '2023-12-05', 9800, 'Delivered');




SELECT 
    CASE 
        WHEN status IN ('Shipped', 'Delivered') THEN 'Completed'
        WHEN status = 'Pending' THEN 'Pending'
        WHEN status = 'Cancelled' THEN 'Cancelled'
        ELSE 'Other'
    END AS OrderStatus,
    COUNT(*) AS TotalOrders,
    SUM(totalamount) AS TotalRevenue
FROM Orders
WHERE orderdate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY 
    CASE 
        WHEN status IN ('Shipped', 'Delivered') THEN 'Completed'
        WHEN status = 'Pending' THEN 'Pending'
        WHEN status = 'Cancelled' THEN 'Cancelled'
        ELSE 'Other'
    END
HAVING SUM(totalamount) > 5000
ORDER BY TotalRevenue DESC;
