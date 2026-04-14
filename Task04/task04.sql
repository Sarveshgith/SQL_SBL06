DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com');

INSERT INTO orders (customer_id, product, amount) VALUES
(1, 'Laptop', 80000),
(1, 'Mouse', 1000),
(2, 'Keyboard', 2000);

-- INNER JOIN
SELECT 
    customers.name,
    orders.product,
    orders.amount
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id;

-- LEFT JOIN
SELECT 
    customers.name,
    orders.product,
    orders.amount
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;

-- RIGHT JOIN
SELECT 
    customers.name,
    orders.product,
    orders.amount
FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id;
