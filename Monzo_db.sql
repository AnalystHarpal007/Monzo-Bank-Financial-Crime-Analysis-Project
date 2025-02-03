-- Monzo Dummy Data Generation Script

-- Create Customers Tables
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20) UNIQUE,
    address TEXT,
    date_of_birth DATE,
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Accounts Table
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    account_type VARCHAR(50),
    balance DECIMAL(15,2) DEFAULT 0,
    last_transaction_date TIMESTAMP
);

-- Create Merchants Table
CREATE TABLE merchants (
    merchant_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    country VARCHAR(50)
);

-- Create Transactions Table
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    account_id INT REFERENCES accounts(account_id),
    merchant_id INT REFERENCES merchants(merchant_id),
    amount DECIMAL(15,2),
    currency VARCHAR(10),
    transaction_type VARCHAR(50),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50)
);

-- Create Suspicious Activity Table
CREATE TABLE suspicious_activity (
    fraud_id SERIAL PRIMARY KEY,
    transaction_id INT REFERENCES transactions(transaction_id),
    fraud_reason TEXT,
    detected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Dummy Data into Customers
INSERT INTO customers (name, email, phone_number, address, date_of_birth, join_date) VALUES
('Alice Johnson', 'alice@example.com', '1234567890', '123 Baker St, London', '1990-05-14', NOW()),
('Bob Smith', 'bob@example.com', '0987654321', '456 King St, Manchester', '1985-08-21', NOW());

-- Insert Dummy Data into Accounts
INSERT INTO accounts (customer_id, account_type, balance, last_transaction_date) VALUES
(1, 'Savings', 5000.00, NOW()),
(2, 'Checking', 3000.00, NOW());

-- Insert Dummy Data into Merchants
INSERT INTO merchants (name, category, country) VALUES
('Tech Store', 'Electronics', 'UK'),
('SuperMart', 'Retail', 'UK');

-- Insert Dummy Data into Transactions
INSERT INTO transactions (customer_id, account_id, merchant_id, amount, currency, transaction_type, transaction_date, status) VALUES
(1, 1, 1, 1200.00, 'GBP', 'Purchase', NOW(), 'Completed'),
(2, 2, 2, 50.00, 'GBP', 'Purchase', NOW(), 'Completed');

-- Insert Dummy Data into Suspicious Activity
INSERT INTO suspicious_activity (transaction_id, fraud_reason, detected_at) VALUES
(1, 'Large Transaction in Short Period', NOW());
