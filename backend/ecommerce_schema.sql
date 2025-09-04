CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

CREATE TABLE Customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
	email VARCHAR(100) UNIQUE,
    address TEXT,
    phone VARCHAR(15)
);

CREATE TABLE Orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    status ENUM('Pending','Shipped','Delivered','Returned') DEFAULT 'Pending',
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products
(
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE Order_Items(
	order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
	payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2),
    payment_method ENUM('Card','UPI','Cash On Delivery'),
    payment_status ENUM('Pending','Completed','Failed'),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Shipments (
	shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    shipment_date DATETIME,
    delivery_date DATETIME,
    courier_service VARCHAR(100),
    tracking_number VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);