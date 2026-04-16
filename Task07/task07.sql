-- ROW_NUMBER
SELECT name, department, salary,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_number
FROM employees;

-- RANK
SELECT name, department, salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
FROM employees;

-- DENSE_RANK
SELECT name, department, salary,
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM employees;

-- LEAD
SELECT name, department, salary,
LEAD(salary) OVER (PARTITION BY department ORDER BY salary DESC) AS next_salary
FROM employees;

-- LAG
SELECT name, department, salary,
LAG(salary) OVER (PARTITION BY department ORDER BY salary DESC) AS prev_salary
FROM employees;

-- Combined
SELECT 
    name,
    department,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_number,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM employees;
