# 📊 Sales Performance Dashboard (SQL + Power BI)

## 🚀 Project Overview
This project focuses on analyzing sales data to understand business performance and generate actionable insights using SQL Server and Power BI.

The objective was to transform raw transactional data into a structured format and build an interactive dashboard for decision-making.

---

## 🧩 Business Problem
The business lacked visibility into:
- Overall revenue and profitability
- Region-wise sales performance
- Product-level profitability
- Customer purchasing behavior

Due to this, decision-making was reactive instead of data-driven.

---

## 🎯 Objective
- Clean and prepare raw sales data
- Analyze key business metrics using SQL
- Build an interactive Power BI dashboard
- Identify growth opportunities and loss areas

---

## 🛠️ Tools & Technologies
- SQL Server → Data Cleaning & Analysis  
- Power BI → Dashboard & Visualization  
- DAX → KPI Calculations  
- CSV Dataset (Kaggle Superstore) → Data Source  

---

## 🔄 Project Workflow

### 1. Data Collection
- Imported sales dataset (CSV) into SQL Server

### 2. Data Cleaning (SQL)
- Removed duplicate records using ROW_NUMBER()
- Handled NULL values
- Removed invalid entries (Sales ≤ 0, Quantity ≤ 0)
- Validated date formats

### 3. Data Analysis (SQL)
- Calculated total sales, profit, and orders
- Performed region-wise and category-wise analysis
- Identified top customers and products
- Detected loss-making products
- Used aggregations, subqueries, and window functions

### 4. Data Visualization (Power BI)
- Built a 2-page interactive dashboard:
  
#### Page 1 — Executive Overview
- KPI Cards: Revenue, Profit, Orders, Profit Margin
- Sales Trend (Line Chart)
- Sales by Region (Bar Chart)
- Category Contribution (Donut Chart)
- Segment Analysis (Column Chart)

#### Page 2 — Product & Customer Insights
- Top Products (Bar Chart)
- Profit by Category
- Loss-making Products (Table with highlights)
- Sales by State (Map)
- Top Customers

---

## 📊 Key KPIs
- Total Revenue: ₹2.3M  
- Total Profit: ₹286K  
- Total Orders: 5000+  
- Profit Margin: ~12%  
- Average Order Value  

---

## 📈 Key Insights
- Sales increased consistently over time (~40% growth)
- West region generated the highest revenue
- Consumer segment contributed the majority of sales
- Technology category was the most profitable
- Some products resulted in losses (~₹77K), indicating pricing or discount issues

---

## 💡 Business Impact
- Identified high-performing regions and products
- Highlighted loss-making products for corrective action
- Enabled data-driven decision-making using dashboards

---

## 📁 Repository Structure
Sales-Performance-Dashboard/
│
├── Sales_Performance_SQL_Analysis.sql
├── Sales_Performance_Dashboard.pbix
├── dataset.csv
└── README.md

---

## 🎓 Learnings
- End-to-end data analytics workflow (SQL → Power BI)
- Data cleaning and transformation using SQL
- KPI creation using DAX
- Dashboard design with business storytelling

---

## 📌 Conclusion
This project demonstrates the ability to clean, analyze, and visualize data to generate meaningful business insights using industry tools.
