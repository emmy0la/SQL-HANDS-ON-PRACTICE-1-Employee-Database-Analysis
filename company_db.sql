-- =====================================================
-- SQL HANDS-ON PRACTICE #1 | Employee Database Analysis
-- Author: Emmanuel Olawumi
-- Date: May 2025
-- =====================================================

-- STEP 1: CREATE AND USE DATABASE
-- =====================================================

CREATE DATABASE company_db;
USE company_db;

-- STEP 2: CHECK THE DATA
-- =====================================================

-- See all tables in the database
SHOW TABLES;

-- View all employee records
SELECT * FROM employees;

-- Count total records (including duplicates)
SELECT COUNT(employee_number) AS total_records FROM employees;
-- Result: 40 records

-- Count unique employees (without duplicates)
SELECT COUNT(DISTINCT employee_number) AS unique_employees FROM employees;
-- Result: 15 unique employees


-- =====================================================
-- LEVEL 1: BASIC FILTERING (Simple WHERE conditions)
-- =====================================================

-- 1a. HIGH EARNERS: Find employees earning $120,000 or more
-- Business question: Who are our top-paid employees?

SELECT DISTINCT * FROM employees 
WHERE salary >= 120000;
-- Result: 3 high earners identified


-- 1b. FIND SPECIFIC EMPLOYEE: Employee number 1005
-- Business question: What are the complete details of this employee?

SELECT DISTINCT * FROM employees 
WHERE employee_number = 1005;
-- Result: Grace Kamau, Marketing Coordinator, $72,000, Resigned


-- 1c. DEPARTMENT SEARCH: Everyone in IT department
-- Business question: Who works in our IT team?

SELECT DISTINCT * FROM employees 
WHERE department = 'IT';
-- Result: All IT employees (Analysts and Managers)


-- =====================================================
-- LEVEL 2: SMART LOGIC (Combining conditions with AND, OR, BETWEEN)
-- =====================================================

-- 2a. FINANCE TEAM: Female employees in Finance department
-- Business question: What's the gender distribution in Finance?

SELECT DISTINCT * FROM employees 
WHERE gender = 'Female' 
  AND department = 'Finance';
-- Result: Female Finance employees identified


-- 2b. BUDGET PLANNING: Employees earning between $70,000 and $90,000
-- Business question: Who falls in our mid-range salary band?

SELECT DISTINCT * FROM employees 
WHERE salary BETWEEN 70000 AND 90000;
-- Result: Mid-range salary employees listed


-- 2c. AVAILABILITY CHECK: Employees who are NOT Active
-- Business question: Who is currently out of office?

SELECT DISTINCT * FROM employees 
WHERE employment_status IN ('Resigned', 'On Leave');
-- Alternative: WHERE employment_status <> 'Active'
-- Result: 3 employees inactive (2 On Leave, 1 Resigned)


-- =====================================================
-- LEVEL 3: PATTERN MATCHING (Using LIKE and IN)
-- =====================================================

-- 3a. MANAGEMENT SEARCH: Anyone with "Manager" in job title
-- Business question: Who holds management positions?

SELECT DISTINCT * FROM employees 
WHERE job_title LIKE '%Manager';
-- %Manager means: anything before the word Manager
-- Result: Mary Mensah (Finance Manager), Lerato Abebe (IT Manager)


-- 3b. REGIONAL SUPPORT: Employees in Sales, Marketing, or Operations
-- Business question: Who works in our customer-facing departments?

SELECT DISTINCT * FROM employees 
WHERE department IN ('Sales', 'Marketing', 'Operations');
-- Result: All employees from these 3 departments


-- 3c. NAME LOOKUP: First names starting with letter "A"
-- Business question: Who has a name starting with A?

SELECT DISTINCT * FROM employees 
WHERE first_name LIKE 'A%';
-- A% means: starts with A, anything after
-- Result: Amina Ndlovu (HR Officer, On Leave)


-- =====================================================
-- LEVEL 4: THE FINAL BOSS (All conditions combined)
-- =====================================================

-- Business Question: Find all Male employees who:
-- 1. Work in Sales OR IT department
-- 2. Were hired after January 1, 2015
-- 3. Earn more than $80,000

SELECT DISTINCT * FROM employees 
WHERE gender = 'Male'                    -- Male employees only
  AND hire_date > '2015-01-01'           -- Hired after 2015
  AND salary > 80000                     -- Earn above 80k
  AND department IN ('Sales', 'IT');     -- Work in Sales or IT

-- Result: 2 employees meet all conditions


-- =====================================================
-- EXTRA: QUICK SUMMARY QUERIES (For insights)
-- =====================================================

-- How many employees in each department?
SELECT department, COUNT(DISTINCT employee_number) AS employee_count
FROM employees
GROUP BY department;

-- Average salary by department?
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- How many Active vs Inactive employees?
SELECT employment_status, COUNT(DISTINCT employee_number) AS count
FROM employees
GROUP BY employment_status;