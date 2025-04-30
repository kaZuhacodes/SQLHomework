--- 2. Common Data Types

-- Create a table data_types_demo with columns covering at least one example of each data type covered in class.
-- Insert values into the table.
-- Retrieve and display the values.


DROP TABLE IF EXISTS data_types_demo
CREATE TABLE data_types_demo
(
    numeric1 TINYINT,
    numeric2 SMALLINT,
    numeric3 INT,
    numeric4 BIGINT,
    numeric5 DECIMAL(10,2),
    numeric6 FLOAT,

    string1 CHAR(50),
    string2 NCHAR(50),
    string3 VARCHAR(50), 
    string4 NVARCHAR(50),

    date1 DATE,
    time1 TIME,
    datetime1 DATETIME
)

INSERT INTO data_types_demo(
    numeric1, numeric2, numeric3, numeric4, numeric5, numeric6, 
    string1, string2, string3, string4, 
    date1, time1, datetime1)
VALUES
(
    1, 100, -122, 100000, 1.22, -22.33334,
    'hello', 'i am here', 'lets be friends', 'towards freedom',
    '2024-04-29', '01:08', GETDATE()
)

SELECT * FROM data_types_demo