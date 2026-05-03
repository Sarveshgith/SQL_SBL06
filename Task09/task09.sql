\echo "Order Table Creation"

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date DATE,
    amount NUMERIC
);

INSERT INTO orders (order_date, amount) VALUES
('2026-01-01', 100),
('2026-01-05', 200),
('2026-02-01', 300),
('2026-02-10', 400);

\echo "PROCEDURE DEMO";

CREATE OR REPLACE PROCEDURE get_total_sales(
    start_date DATE,
    end_date DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    total NUMERIC;
BEGIN
    SELECT SUM(amount)
    INTO total
    FROM orders
    WHERE order_date BETWEEN start_date AND end_date;

    RAISE NOTICE 'Total Sales: %', total;
END;
$$;

CALL get_total_sales('2026-01-01', '2026-01-31');

\echo "FUNCTION DEMO";

CREATE OR REPLACE FUNCTION calculate_discount(amount NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
BEGIN
    IF amount > 300 THEN
        RETURN amount * 0.9;  -- 10% discount
    ELSE
        RETURN amount;
    END IF;
END;
$$;

SELECT id, amount, calculate_discount(amount) AS discounted_amount
FROM orders;
