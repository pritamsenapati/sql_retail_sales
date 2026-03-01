# 🛍 Retail Sales Performance Analysis  
**End-to-End Data Analytics Project (Python + SQL + Excel Dashboard)**

## 📌 1. Executive Summary

This project analyzes retail transaction data to evaluate business performance, customer behavior, profitability, and revenue trends.

The objective was to move beyond basic revenue reporting and develop a comprehensive performance dashboard that answers key business questions around:

- Profitability by product category
- Customer retention and spending behavior
- Seasonal revenue patterns
- Revenue concentration risks
- Operational sales patterns

The final output includes:

- Data cleaning in Python
- Analytical queries in SQL
- Interactive dashboard in Excel

---

## 🎯 2. Business Problem

Retail businesses often track revenue but lack visibility into:

- Which categories drive profit vs. just revenue
- Whether growth is sustainable or seasonal
- Customer concentration risk
- Repeat customer strength
- Operational peak periods

This project aims to answer:

- Which product category generates the most revenue and profit?
- How is revenue changing month-over-month?
- Which quarter performs best?
- Which customer segments contribute most?
- Are we dependent on a small group of customers?
- When do sales peak operationally?

---

## 🗂 3. Dataset Overview

**Columns Used:**

- transactions_id  
- sale_date  
- sale_time  
- customer_id  
- gender  
- age  
- category  
- quantity  
- price_per_unit  
- cogs  
- total_sale  
- profit  
- profit_margin  
- high_value  
- Year, Month, Quarter, Day, etc.

**Total Transactions:** 2000  
**Total Unique Customers:** 157

---

## 🧹 4. Data Cleaning & Preparation (Python)

Performed using Pandas:

- Handled missing values
- Standardized date and time formats
- Created derived columns:
  - Year
  - Month Name
  - Quarter
  - Day Name
  - Time of Day (Morning/Afternoon/Evening/Night)
- Calculated:
  - Profit = total_sale - cogs
  - Profit Margin
  - High Value flag

This ensured structured, analysis-ready data.

---

## 🗄 5. SQL Analysis

Performed analytical queries including:

- Revenue by Category
- Profit by Category
- Monthly Revenue Trend
- Quarter Performance
- Revenue by Gender
- Revenue by Age Group
- Repeat Customer Identification
- Pareto Analysis (Top 20% customers)

Used:

- `GROUP BY`
- Window Functions
- CTEs
- `CASE` statements
- Ranking functions

---

## 📊 6. KPI Dashboard Metrics

### 🔹 Financial KPIs

- **Total Revenue:** ₹9,11,720
- **Total Profit:** ₹7,21,957
- **Profit Margin:** 79.19%
- **Average Order Value:** ₹456

### 🔹 Customer KPIs

- **Unique Customers:** 157
- **Transactions:** 2000
- **Avg Transactions per Customer:** ~13
- **Revenue per Customer:** ₹5,807
- **Repeat Customer Rate:** High (strong retention)

**Insight:**  
The business operates on a repeat-customer-heavy model.

---

## 📈 7. Key Analytical Insights

### 🔥 1. Category Performance

- Clothing and Electronics generate the highest profit (~₹247K each).
- Beauty slightly lower (~₹229K).
- Profit distribution is balanced — low category dependency risk.

### 📅 2. Monthly Revenue Trend

- Strong spike in September (+161% MoM growth).
- Q4 (Sep–Dec) shows highest revenue concentration.

**Insight:**  
Likely seasonal or promotional impact.

### 📆 3. Quarterly Performance

- Q4 outperforms all other quarters.

**Strategic Recommendation:**  
Allocate marketing and inventory budget toward Q4.

### 👥 4. Gender Contribution

- Revenue distribution nearly equal between Male and Female.

**Insight:**  
Balanced customer base — no demographic over-dependence.

### 🎂 5. Age Group Analysis

- Identified highest spending age segment.

**Strategic use:**  
Target promotions toward high-value age group.

### 📊 6. Customer Concentration (Pareto Insight)

- Top 20% customers contribute a significant portion of revenue.

**Insight:**  
Monitor high-value customers carefully to reduce churn risk.

### 🕒 7. Time of Day Analysis

- Identified peak operational hours.

**Operational Recommendation:**  
Optimize staffing and promotional timing.

### ⚠ Risk Analysis

- Revenue spike concentrated in Q4 → possible seasonality risk.
- Business dependent on repeat customers → must maintain retention programs.
- Revenue not overly dependent on one category → healthy distribution.

---

## 🎨 8. Dashboard Design

Built interactive Excel dashboard with:

- KPI cards
- Revenue by Category
- Profit by Category
- Monthly Revenue Trend
- MoM Growth %
- Quarterly Comparison
- Customer Segmentation
- Pareto Analysis
- Interactive slicers (Year, Category, Gender)

**Focused on:**

- Clean corporate design
- Consistent color theme
- Minimal clutter
- Executive-friendly layout

---

## 🧠 9. Strategic Recommendations

- Increase marketing push before Q4 peak.
- Develop loyalty program for top 20% customers.
- Promote underperforming months (June, August).
- Focus on margin optimization in Beauty category.
- Use time-of-day insights for campaign targeting.

---

## 🏁 10. Conclusion

This project demonstrates the transition from basic revenue reporting to full business intelligence analysis.

Instead of focusing solely on revenue, the analysis covered:

- Profitability
- Growth trends
- Customer behavior
- Revenue concentration
- Seasonality
- Operational efficiency

This holistic approach provides actionable business insights rather than descriptive reporting.

---

## 🛠 Tools Used

- Python (Pandas, NumPy)
- SQL
- Excel (Pivot Tables, Slicers, Dashboard Design)

---

## ⭐ Portfolio Note

This project demonstrates:

- End-to-end data analytics workflow
- Business-focused thinking
- KPI structuring
- Executive-level reporting
- Analytical storytelling