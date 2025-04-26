CREATE TABLE invoice
(
    invoice_id INT IDENTITY(1,1) PRIMARY KEY,
    amount DECIMAL
)

INSERT INTO invoice(amount) VALUES(100.00);
INSERT INTO invoice(amount) VALUES(200.00);
INSERT INTO invoice(amount) VALUES(300.00);
INSERT INTO invoice(amount) VALUES(400.00);
INSERT INTO invoice(amount) VALUES(500.00);

SET IDENTITY_INSERT invoice ON;
INSERT INTO invoice(invoice_id, amount) VALUES(100, 999.99);
SET IDENTITY_INSERT invoice OFF;

SELECT * FROM invoice