CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary INT CHECK (salary > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employees (name, department, salary) VALUES
('Alice', 'Engineering', 60000),
('Bob', 'Sales', 45000),
('Charlie', 'Engineering', 70000),
('David', 'HR', 40000),
('Eve', 'Sales', 50000);

SELECT * FROM employees;
