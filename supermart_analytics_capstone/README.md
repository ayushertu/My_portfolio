# 🛒 SuperMart Analytics Capstone

**Author:** Aishat Saleh Muhammad

---

## 📖 Overview

SuperMart Analytics Capstone is a comprehensive SQL analytics project built using PostgreSQL and pgAdmin 4. The project explores a simulated Nigerian retail chain database to generate actionable business insights related to sales performance, customer behavior, employee productivity, and inventory management.

The project progresses from foundational SQL concepts to advanced analytical reporting techniques, providing practical experience with real-world business intelligence scenarios.

---

## 🎯 Project Objective

The goal of this project is to demonstrate practical SQL analytics skills by exploring a retail sales database and generating meaningful business insights that support data-driven decision-making.

The project focuses on:

* Revenue analysis and sales reporting
* Customer segmentation and lifetime value analysis
* Employee performance evaluation
* Product and inventory assessment
* Regional and geographic performance analysis
* Advanced SQL problem-solving techniques

---

## 📊 Dataset Summary

| Metric          | Value                    |
| --------------- | ------------------------ |
| Customers       | 800                      |
| Employees       | 35                       |
| Products        | 68                       |
| Orders          | 2,000                    |
| Order Items     | 5,508                    |
| Analysis Period | January 2021 – June 2024 |
| Currency        | Nigerian Naira (₦)       |

---

## 🗄️ Database Schema

The relational database consists of seven core tables:

### 1. Regions

Stores market regions where customers and sales activities are located.

### 2. Categories

Contains product category classifications.

### 3. Employees

Maintains employee records including:

* Employee details
* Job roles
* Hire dates
* Salaries

### 4. Customers

Stores customer demographic and registration information.

### 5. Products

Contains product catalog information including:

* Product names
* Categories
* Unit prices
* Stock quantities

### 6. Orders

Stores order-level transaction details and order statuses:

* Delivered
* Pending
* Cancelled

### 7. Order Items

Stores line-item transaction data including:

* Product purchased
* Quantity sold
* Unit selling price
* Discount applied

---

## 🧠 Skills Demonstrated

This project showcases proficiency in:

* SQL Query Writing
* Data Cleaning & Validation
* Data Exploration
* Data Aggregation
* Business Intelligence Reporting
* Revenue Analytics
* Customer Segmentation
* Employee Performance Analysis
* Inventory Analysis
* Relational Database Management
* JOIN Operations
* Subqueries
* Common Table Expressions (CTEs)
* Conditional Logic with CASE Statements
* Analytical Problem Solving

---

## 📂 Repository Structure

```text
├── supermart_analytics_results/
│   └── Query outputs and result previews

├── README.md

├── SQL_Scripts/
│   ├── supermart_analytics_project_data_query.sql
│   └── supermart_analytics_project_questions_queries.sql
```

---

## 📚 Project Sections

| Section | Topic                                    |
| ------- | ---------------------------------------- |
| A       | SELECT, WHERE, DISTINCT, ORDER BY, LIMIT |
| B       | COUNT, SUM, AVG, MIN, MAX, ROUND         |
| C       | GROUP BY, HAVING                         |
| D       | LIKE, ILIKE, Wildcards                   |
| E       | INNER JOIN, LEFT JOIN, Multi-table JOIN  |
| F       | CASE Expressions                         |
| G       | Subqueries                               |
| H       | Common Table Expressions (CTEs)          |
| I       | Advanced Capstone Challenge              |
| J       | Customer Lifetime Value (CLV) Report     |

---

## 💰 Revenue Calculation Formula

Revenue is calculated using the formula:

```sql
quantity * unit_price * (1 - discount / 100.0)
```

---

## 🔍 Analytical Core Components

### Fundamental SQL Operations

The project begins with foundational querying techniques including:

* Data filtering using WHERE clauses
* Distinct value extraction
* Sorting and ranking records
* Aggregate calculations
* Conditional filtering
* Pattern matching using LIKE and ILIKE

---

### Aggregations & Business Reporting

Advanced aggregations are used to generate insights such as:

* Total sales revenue
* Average order values
* Customer purchase frequency
* Product performance metrics
* Regional sales summaries

---

### JOIN Operations

Multiple JOIN techniques are implemented to combine data across:

* Customers and Orders
* Orders and Order Items
* Products and Categories
* Employees and Sales Transactions

These relationships enable complete business reporting across the database.

---

### CASE-Based Classification

CASE expressions are utilized to classify records into meaningful business categories.

Examples include:

#### Product Pricing Tiers

* Budget
* Mid-Range
* Premium

#### Employee Performance Bands

* Elite
* Strong
* Developing
* Inactive

---

### Subqueries

Subqueries are used to:

* Compare product sales against overall averages
* Identify top-performing records
* Benchmark employee and customer performance
* Generate dynamic business comparisons

---

### Common Table Expressions (CTEs)

CTEs are implemented to simplify complex analytical reporting including:

* Month-over-month revenue analysis
* Customer purchase frequency tracking
* Best-selling product identification
* Sales trend analysis

---

## 🚀 Advanced Capstone Reports

### Employee Sales Performance Report

A comprehensive employee evaluation report that:

* Calculates revenue generated per employee
* Tracks order conversion performance
* Handles missing values using COALESCE
* Categorizes employees into performance bands
* Highlights top-performing sales personnel

Performance Categories:

| Category   | Description                   |
| ---------- | ----------------------------- |
| Elite      | Outstanding sales performance |
| Strong     | Above-average performance     |
| Developing | Moderate performance          |
| Inactive   | No recorded sales activity    |

---

### Customer Lifetime Value (CLV) Report

A customer analytics report designed to evaluate long-term customer contribution.

The report:

* Combines customer demographics with purchasing history
* Calculates lifetime spending
* Measures purchase frequency
* Identifies retention opportunities
* Segments customers based on historical behavior

Customer Segments:

| Segment        | Description                 |
| -------------- | --------------------------- |
| VIP            | Highest-value customers     |
| Loyal          | Frequent repeat customers   |
| One-Time Buyer | Single purchase customers   |
| No Conversion  | Registered but no purchases |

---

## 📈 Key Insights

### Employee Performance

* Identified top-performing employees based on revenue contribution and sales volume.
* Segmented employees into data-driven performance tiers.
* Highlighted workforce productivity trends across the analysis period.

### Customer Behaviour

* Classified customers into meaningful loyalty segments.
* Measured customer lifetime value and repeat purchase behavior.
* Identified high-value customer groups for retention strategies.

### Revenue Analysis

* Tracked revenue performance across products, categories, and regions.
* Evaluated revenue trends over multiple years.
* Identified top-selling products and revenue-driving categories.

### Geographic Performance

* Analyzed sales distribution across multiple cities and regions.
* Highlighted locations contributing the highest revenue.
* Identified regional demand patterns.

### Inventory Intelligence

* Categorized products into pricing tiers.
* Evaluated inventory performance against overall catalog benchmarks.
* Identified products with strong and weak sales performance.

---

## 💻 Technology Stack

| Tool       | Purpose                                   |
| ---------- | ----------------------------------------- |
| PostgreSQL | Relational Database Management System     |
| pgAdmin 4  | Database Administration & Query Execution |
| SQL        | Data Querying and Analytics               |

---

## 📈 Potential Business Applications

Insights generated from this project can support:

* Sales performance optimization
* Customer retention campaigns
* Loyalty program development
* Regional expansion planning
* Product portfolio management
* Inventory planning and forecasting
* Workforce performance evaluation

---

## 🌟 Business Value

This project simulates real-world retail analytics scenarios and demonstrates the ability to transform raw transactional data into actionable business insights using SQL.

The analyses provide a foundation for strategic decision-making in:

* Revenue growth initiatives
* Customer relationship management
* Operational efficiency
* Inventory optimization
* Employee performance management

---
