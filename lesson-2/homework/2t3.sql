-- #### **3. Inserting and Retrieving an Image**
-- - Create a `photos` table with an `id` column and a `varbinary(max)` column.
-- - Insert an image into the table using `OPENROWSET`.
-- - Write a Python script to retrieve the image and save it as a file.



DROP TABLE IF EXISTS photos
CREATE TABLE photos
(
    id INT PRIMARY KEY,
    photo VARBINARY(MAX)
)

INSERT INTO photos(id, photo)
SELECT 1, *
FROM openrowset(
    BULK '/Users/zufarbekxalilov/Desktop/Codes/apple.png', SINGLE_BLOB
) AS img




