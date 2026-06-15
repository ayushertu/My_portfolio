# 🛒 SuperMart Analytics Capstone

**Author:** Aishat Saleh Muhammad
**Tool:** PostgreSQL 

---

## Overview

A SQL analytics project querying a Nigerian retail chain's sales database to generate insights on revenue, employee performance, customer behaviour, and inventory across 10 sections.

**Dataset:** 800 customers · 35 employees · 68 products · 2,000 orders · 5,508 order items
**Period:** January 2021 – June 2024 | **Currency:** Nigerian Naira (₦)

---
## Database Schema
The relational schema consists of the following 7 core tables[cite: 9]:
* `regions`: Market regions[cite: 9].
* [cite_start]`categories`: Product groupings[cite: 9].
* [cite_start]`employees`: Corporate roster, roles, hire dates, and salaries[cite: 9].
* [cite_start]`customers`: Profiles and demographics[cite: 9].
* [cite_start]`products`: Stock information and baseline catalogue prices[cite: 9].
* [cite_start]`orders`: Order head details, tracking statuses (`Delivered`, `Pending`, `Cancelled`)[cite: 9, 22].
* [cite_start]`order_items`: Granular transactional line items tracking quantities and active discounts[cite: 9].
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

*AI Community Africa · 2nd Cohort 2025/2026*
