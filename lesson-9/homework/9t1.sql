--### Task 1
--Given this Employee table below, find the level of depth each employee from the President. 

Drop table if exists Employees

CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');

--president - 0
--director - 1
--office manager - 1
--engineer - 2

;WITH EmployeeDepth AS (
    SELECT 
        EmployeeID,
        ManagerID,
        JobTitle,
        0 AS Depth
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT 
        e.EmployeeID,
        e.ManagerID,
        e.JobTitle,
        ed.Depth + 1 AS Depth
    FROM Employees e
    JOIN EmployeeDepth ed ON e.ManagerID = ed.EmployeeID
)

SELECT 
    EmployeeID,
    JobTitle,
    Depth
FROM EmployeeDepth
ORDER BY Depth, EmployeeID;



--### Task 2


DECLARE @N INT = 10; 


WITH FactorialCTE AS (
    
    SELECT 
        Number = 1,
        Factorial = CAST(1 AS BIGINT)
    
    UNION ALL

    
    SELECT 
        Number = Number + 1,
        Factorial = Factorial * (Number + 1)
    FROM FactorialCTE
    WHERE Number < @N - 1
)

SELECT 
    0 AS Number,
    1 AS Factorial
UNION ALL
SELECT 
    Number, 
    Factorial 
FROM FactorialCTE
ORDER BY Number;


--### Task 3
--Find Fibonacci numbers up to $N$.

DECLARE @N INT = 1000; 


WITH FibonacciCTE AS (
    
    SELECT 
        Fn1 = 0,
        Fn2 = 1,
        Term = 1,
        Value = 1

    UNION ALL

   
    SELECT 
        Fn1 = Fn2,
        Fn2 = Value,
        Term = Term + 1,
        Value = Fn1 + Fn2
    FROM FibonacciCTE
    WHERE Value <= @N
)

SELECT 
    Term,
    Value
FROM FibonacciCTE
WHERE Value <= @N
ORDER BY Term;


