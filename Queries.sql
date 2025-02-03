-- Query 1: Detect High-Frequency Transactions in a Short Period
SELECT customer_id, COUNT(transaction_id) AS transaction_count
FROM transactions
WHERE transaction_date >= NOW() - INTERVAL '5 minutes'
GROUP BY customer_id
HAVING COUNT(transaction_id) > 5;

-- Query 2: Identify Transactions from Blacklisted Merchants
SELECT t.transaction_id, t.customer_id, t.amount, m.name AS merchant_name
FROM transactions t
JOIN merchants m ON t.merchant_id = m.merchant_id
WHERE m.category IN ('Blacklisted', 'High-Risk');

-- Query 3: Find Unusual Account Balance Drops
SELECT a.account_id, t.transaction_id, t.amount, a.balance
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
WHERE t.amount > 0.5 * a.balance;

-- Query 4: Detect Unusual Cross-Border Transactions
SELECT t.customer_id, COUNT(t.transaction_id) AS transaction_count, SUM(t.amount) AS total_amount
FROM transactions t
JOIN merchants m ON t.merchant_id = m.merchant_id
WHERE t.amount > 5000 AND m.country != 'UK'
GROUP BY t.customer_id
HAVING COUNT(t.transaction_id) > 3;

-- Query 5: Detect Structuring Transactions to Evade Reporting
SELECT customer_id, COUNT(transaction_id) AS transaction_count, SUM(amount) AS total_amount
FROM transactions
WHERE amount BETWEEN 9000 AND 9999
GROUP BY customer_id
HAVING COUNT(transaction_id) > 3;

-- Query 6: Identify ATM Withdrawals Exceeding Daily Limits
SELECT customer_id, SUM(amount) AS total_withdrawn, COUNT(transaction_id) AS withdrawals
FROM transactions
WHERE transaction_type = 'ATM Withdrawal'
AND transaction_date >= NOW() - INTERVAL '1 day'
GROUP BY customer_id
HAVING SUM(amount) > 2000;

-- Query 7: Detect Dormant Accounts Suddenly Becoming Active
SELECT account_id, COUNT(transaction_id) AS transaction_count, SUM(amount) AS total_amount
FROM transactions
WHERE transaction_date >= NOW() - INTERVAL '1 week'
AND account_id IN (
    SELECT account_id FROM accounts
    WHERE last_transaction_date <= NOW() - INTERVAL '6 months'
)
GROUP BY account_id
HAVING SUM(amount) > 5000;

-- Query 8: Identify Multiple Accounts Linked to the Same Identity
SELECT customer_id, COUNT(DISTINCT account_id) AS account_count
FROM accounts
GROUP BY customer_id
HAVING COUNT(DISTINCT account_id) > 2;

-- Query 9: Detect Synthetic Identity Fraud
SELECT customer_id, COUNT(DISTINCT email) AS email_count, COUNT(DISTINCT phone_number) AS phone_count
FROM customers
GROUP BY customer_id
HAVING COUNT(DISTINCT email) > 1 OR COUNT(DISTINCT phone_number) > 1;

-- Query 10: Identify Money Mule Accounts
SELECT customer_id, COUNT(transaction_id) AS transaction_count, SUM(amount) AS total_amount
FROM transactions
WHERE transaction_type = 'Transfer'
GROUP BY customer_id
HAVING COUNT(transaction_id) > 10 AND SUM(amount) > 10000;
