-- Non-correlated subquery (overall avg)
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

-- Correlated subquery (dept avg)
SELECT e1.*
FROM employees e1
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e1.department
);

-- Subquery in SELECT
SELECT 
    name,
    department,
    salary,
    (
        SELECT AVG(e2.salary)
        FROM employees e2
        WHERE e2.department = e1.department
    ) AS dept_avg_salary
FROM employees e1;

-- Subquery with IN
SELECT *
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 1
);

-- Subquery with NOT IN
SELECT *
FROM employees
WHERE department NOT IN (
    SELECT department FROM employees WHERE department = 'HR'
);
