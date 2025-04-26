CREATE TABLE category
(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
)

CREATE TABLE item
(
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    cat_id INT FOREIGN KEY REFERENCES category(category_id)
)

SELECT name
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('item');

ALTER TABLE item
DROP CONSTRAINT FK__item__cat_id__3118447E;

ALTER TABLE item
ADD CONSTRAINT fk_item_cat_id FOREIGN KEY(cat_id) REFERENCES category(category_id)

SELECT * FROM category
SELECT * FROM item
