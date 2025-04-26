CREATE TABLE customer
(
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)  DEFAULT 'Unknown'
)

SELECT name
FROM sys.default_constraints
WHERE parent_object_id = OBJECT_ID('customer');

ALTER TABLE customer
DROP CONSTRAINT DF__customer__city__3E723F9C;

ALTER TABLE customer
ADD CONSTRAINT df_customer_city DEFAULT 'Unknown' FOR city;

SELECT * FROM customer