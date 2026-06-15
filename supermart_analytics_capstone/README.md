# 🛒 SuperMart Analytics Capstone

**Author:** Aishat Saleh Muhammad
---

## Overview

A SQL analytics project querying a Nigerian retail chain's sales database to generate insights on revenue, employee performance, customer behaviour, and inventory across 10 sections.

**Dataset:** 800 customers · 35 employees · 68 products · 2,000 orders · 5,508 order items
**Period:** January 2021 – June 2024 | **Currency:** Nigerian Naira (₦)

---
## Database Schema
The relational schema consists of the following 7 core tables:
* `regions`: Market regions.
* `categories`: Product groupings.
* `employees`: Corporate roster, roles, hire dates, and salaries.
* `customers`: Profiles and demographics.
* `products`: Stock information and baseline catalogue prices.
* `orders`: Order head details, tracking statuses (`Delivered`, `Pending`, `Cancelled`).
* `order_items`: Granular transactional line items tracking quantities and active discounts.
---

## Sections

| Section | Topic |
|---|---|
| A | SELECT, WHERE, DISTINCT, ORDER BY, LIMIT |
| B | COUNT, SUM, AVG, MIN, MAX, ROUND |
| C | GROUP BY, HAVING |
| D | LIKE, ILIKE, Wildcards |
| E | INNER JOIN, LEFT JOIN, Multi-table JOIN |
| F | CASE Expressions |
| G | Subqueries |
| H | CTEs |
| I | Capstone Challenge — all concepts |
| J | Bonus — Customer Lifetime Value Report |

---

## Revenue Formula
```sql
quantity * unit_price * (1 - discount / 100.0)
```

---
## Repository Structure
```text
├── supermart_analytics_results/                              # Previews and sample outputs of query
├──  README.md                                                # Documentation
├── SQL_Scripts/
│   ├── supermart_analytics_project_data_query.sql            # DDL Script (Data import, Table Creation & Relationships)
│   └── supermart_analytics_project_questions_queries.sql     # Complete Capstone Queries (Sections A - J)

🛠️ Key Analytical Core Components
The codebase is structured to solve intermediate and advanced database reporting challenges:

Fundamentals & Dynamic Aggregations: Basic filtering, geographic groupings, alphanumeric sorting, pattern-matching (LIKE/ILIKE), and localized cohort auditing.

Logical Matrix Transformations & Subqueries: Utilizing inline conditional CASE expressions to separate product stocks into pricing tiers (Budget, Mid-Range, Premium) and using subqueries to benchmark individual transactions against overall historical catalog averages.

Common Table Expressions (CTEs): Constructing chained WITH statements to model month-over-month trends, isolate best-selling category items, and calculate frequency buckets.

Advanced Enterprise Capstone Dashboards:

Employee Sales Performance Report: Aggregates key conversion records strictly within the 2021–2024 performance window, introducing fallback strings (COALESCE) to safeguard records for employees with zero sales, and grouping them into performance bands (Elite, Strong, Developing, Inactive).

Customer Lifetime Value (CLV) Report: Joins user demographics with order lines to analyze historical interaction behaviors, parsing consumers registered before 2024 into distinct behavioral segments (VIP, Loyal, One-Time Buyer, No Conversions).

💻 Tech Stack & Environment
Database Management System: PostgreSQL

Administration Panel: pgAdmin 4

Query Language: SQL (Structured Query Language)
Key Insights Summary 
Employee Standouts: Clean separation of personnel into data-driven salary bands and performance brackets.
Geographic Demand: High-density analysis highlighting top performing shipment hubs among the 30 active cities.
Customer Segments: Successful implementation of frequency tiers to target dynamic email marketing initiatives toward specific consumer habits.  
