-- Filter by department
SELECT * FROM employees WHERE department = 'Sales';

-- Sort by salary ascending
SELECT * FROM employees ORDER BY salary ASC;

-- Sort by salary descending
SELECT * FROM employees ORDER BY salary DESC;

-- AND condition
SELECT * FROM employees 
WHERE department = 'Engineering' AND salary > 60000;

-- OR condition
SELECT * FROM employees 
WHERE department = 'HR' OR department = 'Sales';

-- Filter + Sort
SELECT * FROM employees 
WHERE department = 'Sales'
ORDER BY salary DESC;
