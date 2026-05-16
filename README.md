# SQL Hands-On Practice #1 | Employee Database Analysis

My first SQL project focused on solving real business questions using an employee database. The project simulates how analysts interact with company data to retrieve insights, filter records, and combine business logic using SQL.

This hands-on practice strengthened my understanding of filtering, logical operators, pattern matching, and multi-condition query writing.

---

# Project Overview

The objective of this project was to transition from learning SQL syntax to applying SQL in realistic analyst scenarios.

The project progresses through four stages:

1. Basic filtering
2. Smart logic using conditions
3. Pattern matching
4. Multi-condition analytical querying

The analysis was completed using MySQL and MySQL Workbench.

---

# Business Problem

Organizations constantly need quick answers from employee data.

Examples include:

- Identifying high earners
- Finding inactive employees
- Reviewing departmental structures
- Tracking hiring trends
- Filtering employees based on multiple business conditions

This project simulates those real-world HR and operational requests using SQL queries.

---

# Dataset Description

The dataset contains employee-level records across multiple departments.

## Fields Included

| Column | Description |
|---|---|
| employee_number | Unique employee ID |
| first_name | Employee first name |
| last_name | Employee last name |
| gender | Male / Female |
| department | Department name |
| job_title | Employee role |
| hire_date | Employment start date |
| salary | Annual salary |
| employment_status | Active, On Leave, Resigned |

## Dataset Summary

| Metric | Value |
|---|---|
| Total Records | 40 |
| Unique Employees | 15 |
| Departments | 6 |

---

# Tools Used

| Tool | Purpose |
|---|---|
| MySQL | Database engine |
| MySQL Workbench | SQL query execution |
| GitHub | Project documentation |

---

# SQL Analysis

# Level 1: Basic Filtering

## 1A. High Earners Analysis

### Business Question
Which employees earn ₦120,000 or more?

```sql
SELECT DISTINCT *
FROM employees
WHERE salary >= 120000;
```

### Insight
- 3 employees fall into the high-income category.
- These employees may represent senior operational or leadership roles.

![Images](https://github.com/emmy0la/SQL-HANDS-ON-PRACTICE-1-Employee-Database-Analysis/blob/8b9fa34980a497a96b0fe346c88e99332f6e7de3/Images/Level%201A.png)

---

## 1B. Specific Employee Lookup

### Business Question
Retrieve full details for employee number 1005.

```sql
SELECT DISTINCT *
FROM employees
WHERE employee_number = 1005;
```

### Insight
- Employee identified: Grace Kamau
- Department: Marketing
- Status: Resigned

![Images](https://github.com/emmy0la/SQL-HANDS-ON-PRACTICE-1-Employee-Database-Analysis/blob/a578b58662065aaffb011c229b04e61932719423/Images/Level%201B.png)

---

## 1C. Department Search

### Business Question
Who works in the IT department?

```sql
SELECT DISTINCT *
FROM employees
WHERE department = 'IT';
```

### Insight
- The IT department contains both technical and managerial roles.
- Useful for departmental workforce analysis.

![Images](https://github.com/emmy0la/SQL-HANDS-ON-PRACTICE-1-Employee-Database-Analysis/blob/a578b58662065aaffb011c229b04e61932719423/Images/Level%201C.png)

---

# Level 2: Smart Logic

## 2A. Female Employees in Finance

### Business Question
Find all female employees working in Finance.

```sql
SELECT DISTINCT *
FROM employees
WHERE gender = 'Female'
AND department = 'Finance';
```

### Insight
- Female representation exists within Finance leadership and operations.

![Images](https://github.com/emmy0la/SQL-HANDS-ON-PRACTICE-1-Employee-Database-Analysis/blob/a578b58662065aaffb011c229b04e61932719423/Images/Level%202A.png)

---

## 2B. Budget Planning

### Business Question
Which employees fall within the ₦70,000–₦90,000 salary range?

```sql
SELECT DISTINCT *
FROM employees
WHERE salary BETWEEN 70000 AND 90000;
```

### Insight
- Mid-level salary employees form a significant portion of the workforce.

![Images](https://github.com/emmy0la/SQL-HANDS-ON-PRACTICE-1-Employee-Database-Analysis/blob/a578b58662065aaffb011c229b04e61932719423/Images/Level%202B.png)

---

## 2C. Availability Check

### Business Question
Which employees are not currently active?

```sql
SELECT DISTINCT *
FROM employees
WHERE employment_status IN ('Resigned', 'On Leave');
```

### Insight
- 3 inactive employees identified.
- Supports workforce planning and replacement decisions.

![Images](https://github.com/emmy0la/SQL-HANDS-ON-PRACTICE-1-Employee-Database-Analysis/blob/a578b58662065aaffb011c229b04e61932719423/Images/Level%202C.png)

---

# Level 3: Pattern Matching

## 3A. Management Search

### Business Question
Find employees with "Manager" in their job title.

```sql
SELECT DISTINCT *
FROM employees
WHERE job_title LIKE '%Manager';
```

### Insight
- Management roles identified across Finance and IT departments.

![Images](https://github.com/emmy0la/SQL-HANDS-ON-PRACTICE-1-Employee-Database-Analysis/blob/a578b58662065aaffb011c229b04e61932719423/Images/Level%203A.png)

---

## 3B. Regional Support Team

### Business Question
Find employees in Sales, Marketing, or Operations.

```sql
SELECT DISTINCT *
FROM employees
WHERE department IN ('Sales', 'Marketing', 'Operations');
```

### Insight
- Cross-functional operational teams identified for business coordination.

![Images](https://github.com/emmy0la/SQL-HANDS-ON-PRACTICE-1-Employee-Database-Analysis/blob/a578b58662065aaffb011c229b04e61932719423/Images/Level%203B.png)

---

## 3C. Name Lookup

### Business Question
Find employees whose first name starts with "A".

```sql
SELECT DISTINCT *
FROM employees
WHERE first_name LIKE 'A%';
```

### Insight
- Demonstrates practical wildcard filtering using LIKE.

![Images](https://github.com/emmy0la/SQL-HANDS-ON-PRACTICE-1-Employee-Database-Analysis/blob/a578b58662065aaffb011c229b04e61932719423/Images/Level%203C.png)

---

# Level 4: Final Boss Query

## Multi-Condition Analyst Query

### Business Question
Find male employees who:

- Work in Sales or IT
- Were hired after 2015-01-01
- Earn more than ₦80,000

```sql
SELECT DISTINCT *
FROM employees
WHERE gender = 'Male'
AND hire_date > '2015-01-01'
AND salary > 80000
AND department IN ('Sales', 'IT');
```

### Insight
- Only 2 employees satisfy all business conditions.
- Demonstrates advanced filtering and analyst-style query logic.

![Images](https://github.com/emmy0la/SQL-HANDS-ON-PRACTICE-1-Employee-Database-Analysis/blob/a578b58662065aaffb011c229b04e61932719423/Images/Level%204.png)

---

# Key SQL Skills Demonstrated

| Skill | Application |
|---|---|
| WHERE Filtering | Basic employee filtering |
| DISTINCT | Duplicate handling |
| BETWEEN | Salary range analysis |
| IN Operator | Department filtering |
| LIKE Wildcards | Pattern matching |
| AND / OR Logic | Multi-condition queries |
| Business Query Thinking | Real HR analysis |

---

# Business Insights

| Finding | Business Meaning |
|---|---|
| 3 employees earn above ₦120k | Leadership compensation visibility |
| 3 inactive employees identified | Workforce continuity risk |
| Finance has female representation | Diversity observation |
| IT and Sales contain high earners | Revenue-driving departments |
| Mid-range salary group is largest | Promotion pipeline opportunity |

---

# Project Structure

```text
SQL-Study-Group-Hands-On-1/
│
├── README.md
├── Hands-on #1.pdf
├── employees.csv
├── Company_db.sql
│
├── Images/
│   ├── Level 1A.png
│   ├── Level 1B.png
│   ├── Level 1C.png
│   ├── Level 2A.png
│   ├── Level 2B.png
│   ├── Level 2C.png
│   ├── Level 3A.png
│   ├── Level 3B.png
│   ├── Level 3C.png
│   └── Level 4.png
```

---

# Learning Outcomes

This project helped me:

- Understand practical SQL filtering
- Combine multiple business conditions
- Use logical operators effectively
- Write cleaner analytical queries
- Think more like a data analyst rather than just writing syntax

---

# Coach's Guidance Applied

> "Don't rush. Think before typing. Break problems into parts. Test your queries. Adjust and try again."

This project reinforced disciplined SQL problem-solving and query validation.

---

# Future Improvements

- Introduce JOIN operations across multiple tables
- Add aggregation using GROUP BY
- Build dashboards using Excel or Power BI
- Expand analysis into employee performance tracking

---

# Author

Emmanuel Olawumi

Data Analyst | SQL | Data Analytics | Digital Strategy

---

# Date Completed

May 2025
