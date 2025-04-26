DROP TABLE IF EXISTS student;
CREATE TABLE student
(
    id int,
    name VARCHAR(50),
    age int
)

ALTER TABLE student
ALTER COLUMN id int NOT NULL;

SELECT * FROM student