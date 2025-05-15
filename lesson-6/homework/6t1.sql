-- 1. Departments table
drop table if exists Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- 2. Employees table
drop table if exists Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 3. Projects table
drop table if exists Projects
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES
(1, 'Alice', 101, 60000),
(2, 'Bob', 102, 70000),
(3, 'Charlie', 101, 65000),
(4, 'David', 103, 72000),
(5, 'Eva', NULL, 68000);

-- Insert data into Projects
INSERT INTO Projects (ProjectID, ProjectName, EmployeeID) VALUES
(1, 'Alpha', 1),
(2, 'Beta', 2),
(3, 'Gamma', 1),
(4, 'Delta', 4),
(5, 'Omega', NULL);


--### **Questions:**  

--1. **INNER JOIN**  
--   - Write a query to get a list of employees along with their department names.  
select e.Name, e.DepartmentID, d.DepartmentName 
from Employees as e
inner join Departments as d
	on e.DepartmentID = d.DepartmentID

--2. **LEFT JOIN**  
--   - Write a query to list all employees, including those who are not assigned to any department.  
select e.Name, e.DepartmentID, d.DepartmentName 
from Employees as e
left join Departments as d
	on e.DepartmentID = d.DepartmentID

--3. **RIGHT JOIN**  
--   - Write a query to list all departments, including those without employees.  
select e.Name, e.DepartmentID, d.DepartmentName 
from Employees as e
right join Departments as d
	on e.DepartmentID = d.DepartmentID

--4. **FULL OUTER JOIN**  
--   - Write a query to retrieve all employees and all departments, even if there’s no match between them.   
select e.Name, e.DepartmentID, d.DepartmentName 
from Employees as e
full join Departments as d
	on e.DepartmentID = d.DepartmentID


--5. **JOIN with Aggregation**  
--   - Write a query to find the total salary expense for each department.  
select *,
	sum(Salary) over(partition by DepartmentName) as total
from Employees as e
inner join Departments as d
	on e.DepartmentID = d.DepartmentID


--6. **CROSS JOIN**  
--   - Write a query to generate all possible combinations of departments and projects.  
select * 
from Departments as d
cross join Projects as p


--7. **MULTIPLE JOINS**  
--   - Write a query to get a list of employees with their department names and assigned project names. Include employees even if they don’t have a project.  
select *
from Employees as e
inner join Departments as d
	on e.DepartmentID = d.DepartmentID
left join Projects as p
	on e.EmployeeID = p.EmployeeID
