DROP TABLE IF EXISTS product;
CREATE TABLE product
(
    product_id INT UNIQUE,
    product_name VARCHAR(50),
    product_price DECIMAL
)

SELECT name
FROM sys.key_constraints
WHERE type = 'UQ'
  AND parent_object_id = OBJECT_ID('product');
  
ALTER TABLE product
DROP CONSTRAINT UQ__product__47027DF4F06053D7; 

ALTER TABLE product
ADD CONSTRAINT u_product_id_name UNIQUE(product_id, product_name);

SELECT * FROM product

