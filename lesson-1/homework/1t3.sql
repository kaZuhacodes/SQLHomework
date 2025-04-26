CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE
)

SELECT name
FROM sys.key_constraints
WHERE type = 'PK'
  AND parent_object_id = OBJECT_ID('orders');

ALTER TABLE orders
DROP CONSTRAINT PK__orders__46596229D890AD3E;

ALTER TABLE orders
ADD CONSTRAINT pk_orders_order_id PRIMARY KEY(order_id);

SELECT * FROM orders