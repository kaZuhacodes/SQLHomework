--## Task 2

--Write a query which will find maximum value from multiple columns of the table.


CREATE TABLE TestMax
(
    Year1 INT
    ,Max1 INT
    ,Max2 INT
    ,Max3 INT
);
GO
 
INSERT INTO TestMax 
VALUES
    (2001,10,101,87)
    ,(2002,103,19,88)
    ,(2003,21,23,89)
    ,(2004,27,28,91);

select * from TestMax

select
	Year1,
	 case
		when Max1 >= Max2 and Max1 >= Max3 then Max1
		when Max2 > Max1 and Max2 >= Max3 then Max2
		else Max3
		end as MaxValue
from TestMax
