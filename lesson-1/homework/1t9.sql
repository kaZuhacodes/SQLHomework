CREATE TABLE book
(
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    published_year INT
)

CREATE TABLE member
(
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(100)
)

CREATE TABLE loan
(
    loan_id INT PRIMARY KEY,
    book_id INT FOREIGN KEY REFERENCES book(book_id),
    member_id INT FOREIGN KEY REFERENCES member(member_id),
    loan_date DATE NOT NULL,
    return_date DATE
)

INSERT INTO book (book_id, title, author, published_year)
VALUES 
(1, '1984', 'George Orwell', 1949),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925);

INSERT INTO member (member_id, name, email, phone_number)
VALUES 
(1, 'Alice Johnson', 'alice@example.com', '123-456-7890'),
(2, 'Bob Smith', 'bob@example.com', '987-654-3210');

INSERT INTO Loan (loan_id, book_id, member_id, loan_date, return_date)
VALUES 
(1, 1, 1, '2024-04-20', NULL),
(2, 2, 2, '2024-04-18', '2024-04-25'),
(3, 3, 1, '2024-04-22', NULL);

SELECT * FROM book
SELECT * FROM member
SELECT * FROM loan