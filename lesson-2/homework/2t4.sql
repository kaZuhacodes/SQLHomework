CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name NVARCHAR(100),
    classes INT,
    tuition_per_class DECIMAL(10,2),
    total_tuition AS (classes * tuition_per_class)
);

INSERT INTO student (student_id, name, classes, tuition_per_class)
VALUES 
(1, 'Alice', 5, 200.00),
(2, 'Bob', 3, 250.00),
(3, 'Charlie', 4, 150.00);

SELECT * FROM student;