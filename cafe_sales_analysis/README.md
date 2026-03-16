# Cafe Sales Analysis
# Project Title: Cafe Sales Data Cleaning & Exploratory Analysis

# Project Overview 
This project involves a comprehensive end-to-end data analysis of 10,000 cafe transactions. The primary focus was on data quality—identifying and correcting inconsistencies in pricing, quantities, and transaction records to derive meaningful business insights.

## Project Structure
- **cafe_sales_analysis**: Contains all the analysis files and notebooks
- **data**: Directory for storing datasets used in the analysis
- **notebooks**: Jupyter notebooks with detailed analysis steps and visualizations
- **dashboard**: Dashboard files showcasing key metrics and insights
  
# Key Technical Tasks Performed:

**Data Cleaning:** Handled missing values in Payment Method and Location. Resolved ERROR and UNKNOWN strings in numeric and categorical columns.

**Feature Engineering**: Calculated Total Spent by multiplying Quantity and Price Per Unit to verify and fix inconsistent revenue data.

**Time-Series Transformation:** Converted transaction dates into DateTime objects to extract Month, Day, and Year for trend analysis.

**Exploratory Data Analysis (EDA)**: Identified top-performing products (Salads and Sandwiches) and analyzed sales growth rates.

# Key Insights:

**Top Revenue Driver**: Salad contributed approximately $15,600 (19.4% of total revenue).

**Transaction Value:** The average transaction value is $8.94.

**Sales Trends:** Noted a significant 7.8% growth in sales during June 2023.

## Conclusion
This project aims to provide actionable insights that can help improve the cafe's operational strategies and ultimately increase profitability.
