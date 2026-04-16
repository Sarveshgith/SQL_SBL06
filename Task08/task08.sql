-- Non-recursive CTE
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.name, e.department, e.salary, d.avg_salary
FROM employees e
JOIN dept_avg d
ON e.department = d.department;

-- Filter with CTE
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.*
FROM employees e
JOIN dept_avg d
ON e.department = d.department
WHERE e.salary > d.avg_salary;

-- Recursive CTE
DROP TABLE IF EXISTS emp_hierarchy;

CREATE TABLE emp_hierarchy (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT
);

INSERT INTO emp_hierarchy (name, manager_id) VALUES
('CEO', NULL),
('Manager1', 1),
('Manager2', 1),
('Employee1', 2),
('Employee2', 2),
('Employee3', 3);

WITH RECURSIVE org_chart AS (
    SELECT id, name, manager_id, 1 AS level
    FROM emp_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.id, e.name, e.manager_id, o.level + 1
    FROM emp_hierarchy e
    JOIN org_chart o
    ON e.manager_id = o.id
)
SELECT * FROM org_chart;
