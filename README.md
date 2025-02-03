![monzo](https://github.com/user-attachments/assets/5945e94c-dc29-45f2-a4fb-2ea56a2a5e87)

# Monzo-Bank-Financial-Crime-Analysis-Project

## Project Overview
This repository contains a simulated financial crime analysis project designed to demonstrate advanced SQL skills, fraud detection techniques, and data analysis methodologies for Monzo Bank’s financial crime investigations. The dataset includes dummy data representing Monzo's transactional ecosystem, along with SQL queries for detecting suspicious activities.

## Repository Structure
- **README.md** (This file: Project overview and instructions)
- **dummy_data.sql** (SQL scripts for generating the dataset)
- **queries.sql** (SQL solutions for detecting financial crime patterns)
- **insights.md** (Key findings, explanations, and analytical insights)

## Getting Started
### Prerequisites
- PostgreSQL or MySQL (any relational database supporting SQL queries)
- A database management tool (e.g., pgAdmin, MySQL Workbench, DBeaver)

## SQL Scripts
### **Monzo_dummy_data.sql**
This file contains SQL statements to generate synthetic data, including:
- `customers` table with user profiles
- `transactions` table simulating Monzo transactions
- `accounts` table storing customer accounts and balances
- `suspicious_activity` table flagging potential fraudulent transactions
- `merchants` table with details of vendors

### **queries.sql**
This file includes SQL queries to detect financial crimes such as:
1. High-frequency transactions in a short period
2. Transactions from blacklisted merchants
3. Unusual account balance drops
4. Unusual cross-border transactions
5. Structuring transactions to evade reporting
6. Excessive ATM withdrawals
7. Dormant accounts becoming active
8. Multiple accounts linked to the same identity
9. Synthetic identity fraud
10. Money mule detection

## Key Insights
### **insights.md**
This file summarizes analytical insights from running the queries, highlighting:
- Transaction velocity anomalies
- Suspicious withdrawals exceeding limits
- Cross-border money laundering risks
- Indicators of synthetic identities and money mules
- Behavioral patterns suggesting fraud

## Contribution
Contributions are welcome! If you have improvements, submit a pull request.

## License
This project is licensed under the MIT License.

## Contact
For questions, reach out via [harpalarmo@gmail.com] or GitHub issues.



