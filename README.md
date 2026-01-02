# Workforce & Compensation Analytics
**SQL Server | Data Modeling | Power BI | DAX**
---


## Project Overview
This project analyzes employee remuneration and expenses for **City of Vancouver employees earning over $75,000 per year** using an end-to-end analytics workflow.

The focus of this project is not only visualization, but **data quality, standardization, dimensional modeling, and business-ready reporting**. Raw open data was cleaned and modeled in SQL Server before being analyzed in Power BI using DAX.

##  Project Objective

The objective of this project is to:
- Clean and standardize a real-world government payroll dataset
- Perform data profiling and quality checks
- Build a star schema for analytical reporting
- Create executive-level and department-level dashboards
- Use DAX for KPIs and year-over-year analysis
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
- DAX (Data Analysis Expressions)
---

## Project Workflow

1. Data ingestion into SQL staging tables  
2. Data profiling and quality validation  
3. Data cleaning and standardization  
4. Dimensional data modeling (star schema)  
5. Power BI reporting with DAX  

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

Cleaning was performed entirely in SQL.
**Key actions:**
- Replaced null expense values with `0`
- Trimmed and standardized text fields
- Consolidated inconsistent department names
- Standardized job titles and corrected numbering inconsistencies
- 
This ensured accurate aggregation and consistent reporting.

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

### Executive Overview — Workforce & Cost Trends

Designed for high-level decision-makers.

**KPIs**
- Total Employees
- Total Departments
- Total Job Titles
- Total Remuneration
- Total Expenses
- Total Compensation

**Insights**
- Workforce growth over time
- Year-over-year changes in remuneration and expenses
- Average compensation trends

---

### Department-Level Workforce & Cost Trends

Designed for operational analysis.

**Features**
- Year and Department slicers
- Top departments by employee count
- Top departments by total remuneration
- Employee count vs average cost per employee

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

