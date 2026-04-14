DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product VARCHAR(100),
    amount INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO orders (product, amount, order_date) VALUES
('Laptop', 80000, NOW() - INTERVAL '5 days'),
('Mouse', 1000, NOW() - INTERVAL '15 days'),
('Keyboard', 2000, NOW() - INTERVAL '35 days'),
('Monitor', 15000, NOW() - INTERVAL '1 day');

-- Date difference
SELECT 
    product,
    order_date,
    CURRENT_DATE - order_date::date AS days_ago
FROM orders;

-- Add interval
SELECT 
    product,
    order_date,
    order_date + INTERVAL '7 days' AS delivery_date
FROM orders;

-- Last 30 days
SELECT *
FROM orders
WHERE order_date >= NOW() - INTERVAL '30 days';

-- Date range
SELECT *
FROM orders
WHERE order_date BETWEEN 
    NOW() - INTERVAL '30 days' AND NOW();

-- Format date
SELECT 
    product,
    TO_CHAR(order_date, 'DD-MM-YYYY') AS formatted_date
FROM orders;

-- Extract date parts
SELECT 
    product,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    EXTRACT(DAY FROM order_date) AS day
FROM orders;
