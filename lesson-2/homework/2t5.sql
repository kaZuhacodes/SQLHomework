CREATE TABLE worker (
    id INT PRIMARY KEY,
    name NVARCHAR(100)
);

BULK INSERT worker
FROM '/app/workers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a' 
);

SELECT * FROM worker;

