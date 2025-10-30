-- create_products_table.sql
CREATE DATABASE IF NOT EXISTS products_db;
USE products_db;

CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Sample data
INSERT INTO products (name, price, stock, description) VALUES
('Laptop Gaming', 15000000.00, 10, 'High-performance gaming laptop'),
('Smartphone', 8000000.00, 25, 'Latest Android smartphone'),
('Headphones', 500000.00, 50, 'Wireless noise-canceling headphones'),
('Keyboard Mechanical', 1200000.00, 30, 'RGB mechanical gaming keyboard'),
('Mouse Gaming', 800000.00, 40, 'High-precision gaming mouse');