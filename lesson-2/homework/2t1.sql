DROP TABLE IF EXISTS test_identity;
CREATE TABLE test_identity
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100)
)

INSERT INTO test_identity (name)
VALUES 
('John'),
('Tom'),
('Cleo'),
('Xinque'),
('Diluc');

DROP TABLE test_identity;
DELETE FROM test_identity;
TRUNCATE TABLE test_identity;

SELECT * FROM test_identity