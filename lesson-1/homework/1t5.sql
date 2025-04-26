CREATE TABLE account
(
   account_id INT PRIMARY KEY,
   balance DECIMAL CHECK (balance >= 0),
   account_type VARCHAR(20) CONSTRAINT check_account_type CHECK (account_type IN ('Saving', 'Checking'))
)

SELECT name
FROM sys.check_constraints
WHERE parent_object_id = OBJECT_ID('account');

ALTER TABLE account
DROP CONSTRAINT CK__account__balance__36D11DD4;
ALTER TABLE account
DROP CONSTRAINT check_account_type

ALTER TABLE account
ADD CONSTRAINT check_account_balance CHECK (balance >= 0);
ALTER TABLE account
ADD CONSTRAINT check_account_type CHECK (account_type IN ('Saving', 'Checking'));

SELECT * FROM account