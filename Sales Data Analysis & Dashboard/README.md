# Sales Performance Dashboard — Power BI

An end-to-end Power BI project analysing retail sales data across regions, product categories, and customers in Nigeria.

---

## Project Summary

Built a fully interactive sales dashboard from a 100-row dataset, covering the complete pipeline from data cleaning to visual storytelling. The dashboard enables filtering by Region, Product, and Year to explore performance at a glance.

---

## Tools & Skills Used

- **Power BI Desktop** — report building, DAX, data modelling
- **Power Query** — data cleaning, duplicate removal, calculated column
- **DAX** — measures for aggregation and time intelligence

---

## What I Built

### Data Preparation
- Imported and cleaned a 100-row retail sales dataset in Power Query
- Removed duplicates and corrected data types
- Added a calculated `Profit` column using a 20% margin: `[Sales] * 0.20`

### Data Model
- Created a `DateTable` using `CALENDAR()` with Year, Month, MonthNum, and Quarter columns
- Established a one-to-many relationship between `DateTable[Date]` and `SalesData[Order Date]`
- Marked the Date table for time intelligence support

### DAX Measures
| Measure | Formula |
|---|---|
| Total Sales | `SUM(SalesData[Sales])` |
| Total Profit | `SUM(SalesData[Profit])` |
| Average Order Value | `DIVIDE([Total Sales], DISTINCTCOUNT(SalesData[Order ID]))` |
| YTD Sales | `TOTALYTD([Total Sales], DateTable[Date])` |

### Dashboard Visuals
1. **Bar chart** — Total Sales by Region
2. **Pie chart** — Total Profit by Product Category
3. **Line chart** — Total Sales and YTD Sales by Month
4. **Customer table** — Sales, Profit, and Average Order Value per customer
5. **Treemap** — Total Sales by Full Region (geocoded to Nigeria)

Slicers: Region · Product · Year

---

## Key Findings

- **Top-performing region:** North — ₦8.5M (34% of total sales)
- **Most profitable category:** Electronics — 91.25% of total profit
- **Total Sales:** ₦25,082,800 | **Total Profit:** ₦5,016,560 | **Avg Order Value:** ₦250,828
