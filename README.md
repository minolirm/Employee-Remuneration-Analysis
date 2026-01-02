# Employee-Remuneration-Analysis
End-to-end data analytics project using SQL Server and Power BI to analyze employee remuneration and expenses for City of Vancouver employees earning over $75,000 per year.
---

##  Project Objective

The objective of this project is to:
- Clean and standardize a real-world government payroll dataset
- Design a relational data model suitable for analytics
- Build an interactive Power BI dashboard to analyze trends, costs, and year-over-year changes
- Demonstrate an end-to-end analytics workflow used in production environments

---

## Dataset Overview

- **Source:** City of Vancouver Open Data Portal  
- **Dataset Name:** Employee Remuneration and Expenses (Earning Over $75,000)  
- **Currency:** CAD  
- **Update Frequency:** Annual  
- **Last Data Update:** April 9, 2025  

**Important Notes:**
- Expenses may not reconcile within the same reporting period
- Data reflects records as of December 31 for each year
- Official financial statements remain the authoritative source

---

## Tools & Technologies

- SQL Server Management Studio (SSMS)
- SQL Server (Relational Database)
- Power BI Desktop

---

## Project Workflow

1. Data ingestion and staging in SQL Server  
2. Data profiling and quality checks  
3. Data cleaning and standardization  
4. Dimensional data modeling (star schema)  
5. Power BI visualization and analysis  

---

## Data Profiling & Quality Checks

Key checks performed:
- Row count validation
- Year range analysis
- Null value detection
- Duplicate record identification
- Negative value checks

**Key Findings:**
- Null values present in the Expenses column
- Duplicate records across Year, Employee, Department, and Title
- No negative values in financial columns
- Inconsistent Department Names and Job TItles
---

## Data Cleaning & Preparation

Cleaning decisions:
- Replaced null expense values with 0
- Trimmed and standardized text fields
- Consolidated department naming variations
- Standardized job titles and corrected inconsistencies

All cleaning logic is documented in the `sql/data_cleaning.sql` script.

---

## Data Modeling

The cleaned data was modeled using a star schema:

- **Fact Table:** `FACT_COMPENSATION`
- **Dimensions:** `EMPLOYEE`, `DEPARTMENT`, `TITLE`

This structure supports efficient slicing and aggregation in Power BI.

*(See schema diagram in `/diagrams/star_schema.png`)*

---

## Power BI Dashboard

The Power BI dashboard provides:
- Total remuneration and expenses over time
- Department-level cost analysis
- Employee and title distribution
- Year-over-Year (YoY) changes in remuneration and expenses

Dashboard file:  
`/powerbi/Employee_Remuneration_Analysis.pbix`

---

## Key Insights

- Certain departments consistently account for a large share of total compensation
- Year-over-year changes vary significantly by department
- Expenses represent a relatively small portion of total compensation compared to remuneration

---

## Assumptions & Limitations

- Expense null values are assumed to be zero
- Dataset includes only employees earning over $75,000
- In-year corrections are not reflected in the data

---

## License

Data is provided under the **Open Government Licence – Vancouver**.

---

