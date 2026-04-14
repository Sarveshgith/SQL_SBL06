-- Count employees per department
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Total salary per department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- Multiple aggregates
SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- HAVING clause (count > 1)
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;

-- HAVING clause (avg salary > 50000)
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
