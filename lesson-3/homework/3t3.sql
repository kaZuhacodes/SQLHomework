--Task 3: Product Inventory Check
--Write an SQL query that:

 --Selects distinct product categories.
 --Finds the most expensive product in each category.
 --Assigns an inventory status using IIF:
	--'Out of Stock' if Stock = 0.
	--'Low Stock' if Stock is between 1 and 10.
	--'In Stock' otherwise.
 --Orders the result by Price descending and skips the first 5 rows.

 CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Products (ProductID, ProductName, Category, Price, Stock)
VALUES 
    (1, 'Laptop', 'Electronics', 1200, 15),
    (2, 'Smartphone', 'Electronics', 800, 30),
    (3, 'Desk Chair', 'Furniture', 150, 5),
    (4, 'LED TV', 'Electronics', 1400, 8),
    (5, 'Coffee Table', 'Furniture', 250, 0),
    (6, 'Headphones', 'Accessories', 200, 25),
    (7, 'Monitor', 'Electronics', 350, 12),
    (8, 'Sofa', 'Furniture', 900, 2),
    (9, 'Backpack', 'Accessories', 75, 50),
    (10, 'Gaming Mouse', 'Accessories', 120, 20);


SELECT 
	DISTINCT Category,
	Productname,
	Price,
	IIF (Stock = 0, 'Out of Stock',
		IIF (Stock BETWEEN 1 AND 10, 'Low Stock',
		'In Stock')) AS InventoryStatus
FROM Products

WHERE PRICE IN(
	SELECT MAX(Price)
    FROM Products AS P2
    WHERE P2.Category = Products.Category
    GROUP BY Category)

ORDER BY Price DESC
OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY