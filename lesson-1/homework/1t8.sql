CREATE TABLE books
(
    book_id INT IDENTITY (1,1) PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    price DECIMAL CHECK (price > 0),
    genre VARCHAR(100) DEFAULT 'Unknown'
)

INSERT INTO books(title, price, genre)
VALUES ('Alchemist', 20.00, 'Fiction')

SELECT * FROM books