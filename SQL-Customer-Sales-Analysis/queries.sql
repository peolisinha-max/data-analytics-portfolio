-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Create Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Sample Data
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Sara', 'Mumbai'),
(3, 'John', 'Bangalore');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Phone', 'Electronics', 20000),
(103, 'Shoes', 'Fashion', 3000);

INSERT INTO sales VALUES
(1, 1, 101, 1, '2024-01-10'),
(2, 2, 102, 2, '2024-01-12'),
(3, 1, 103, 3, '2024-02-05'),
(4, 3, 101, 1, '2024-02-20');

-- Total Sales per Customer
SELECT c.name, SUM(p.price * s.quantity) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.name;

-- Monthly Sales Trend
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month,
SUM(p.price * s.quantity) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- Top Selling Products
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Rank Customers by Spending
SELECT c.name,
SUM(p.price * s.quantity) AS total_spent,
RANK() OVER (ORDER BY SUM(p.price * s.quantity) DESC) AS rank
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.name;
