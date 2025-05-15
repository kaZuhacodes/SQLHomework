Drop table if exists Employees
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name1 VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name1, Department, Salary, HireDate) VALUES
    ('Alice', 'HR', 50000, '2020-06-15'),
    ('Bob', 'HR', 60000, '2018-09-10'),
    ('Charlie', 'IT', 50000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');

select * from Employees

--### Tasks
--#### Ranking Functions
--1. Assign a Unique Rank to Each Employee Based on Salary
select *,
	row_number() over(order by salary) as unique_rank
from Employees
--2. Find Employees Who Have the Same Salary Rank
SELECT *
FROM (
    SELECT *,
           RANK() OVER (ORDER BY Salary) AS u_rank
    FROM Employees
) AS same_rank
WHERE u_rank IN (
    SELECT u_rank
    FROM (
        SELECT RANK() OVER (ORDER BY Salary) AS u_rank
        FROM Employees
    ) AS ranks_only
    GROUP BY u_rank
    HAVING COUNT(*) >= 2
);

--3. Identify the Top 2 Highest Salaries in Each Department
select * 
from
(select
		*,
		rank() over(partition by department order by salary desc) as top2_rank
	from Employees) as ranked
where top2_rank <=2
--4. Find the Lowest-Paid Employee in Each Department
select  
*
from
(select *,
	rank() over(partition by department order by salary) as u_rank
from Employees) as ranked
where u_rank = 1

--5. Calculate the Running Total of Salaries in Each Department
select *,
sum(Salary) over(partition by department order by HireDate) as cumulative
from Employees

--6. Find the Total Salary of Each Department Without GROUP BY
select *,
sum(Salary) over(partition by department) as total
from Employees

--7. Calculate the Average Salary in Each Department Without GROUP BY
select *,
avg(Salary) over(partition by department) as avg
from Employees

--8. Find the Difference Between an Employee’s Salary and Their Department’s Average
select *,
abs(Salary - avg(Salary) over(partition by department)) as difference
from Employees
--9. Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
select *,
avg(Salary) over(order by EmployeeID rows between 1 preceding and 1 following) as avg2
from Employees

--10. Find the Sum of Salaries for the Last 3 Hired Employees
select *,
sum(Salary) over() as total
from
(select *,
row_number() over(order by Hiredate desc) as date_rank
from Employees) as total_rank
where date_rank <=3

--11. Calculate the Running Average of Salaries Over All Previous Employees
select *,
avg(Salary) over(order by HireDate rows between unbounded preceding and current row) as avg3
from Employees   
--12. Find the Maximum Salary Over a Sliding Window of 2 Employees Before and After
select *,
max(Salary) over(order by HireDate rows between 2 preceding and 2 following) as max2
from Employees

--13. Determine the Percentage Contribution of Each Employee’s Salary to Their Department’s Total Salary
select *,
(Salary/(sum(Salary) over(partition by Department)))*100 as percentage1
from Employees