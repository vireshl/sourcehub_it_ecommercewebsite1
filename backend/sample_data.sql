USE ecommerce_db;

-- Insert Customers
INSERT INTO Customers (name, email, address, phone) VALUES
('Amit Sharma', 'amit.sharma@example.com', '123 Green Street, Pune', '9876543210'),
('Priya Verma', 'priya.verma@example.com', '45 Blue Lane, Mumbai', '9988776655'),
('Rohit Nair', 'rohit.nair@example.com', '78 Red Road, Delhi', '9123456780'),
('Sonal Joshi', 'sonal.joshi@example.com', '5 Lotus Street, Ahmedabad', '9876512345'),
('Kunal Mehta', 'kunal.mehta@example.com', '88 Galaxy Towers, Jaipur', '9876567890'),
('Neha Kapoor', 'neha.kapoor@example.com', '11 Olive Lane, Bengaluru', '9999999999');

-- Insert Products
INSERT INTO Products (name, description, price, stock_quantity) VALUES
('Wireless Mouse', 'Ergonomic wireless mouse', 599.00, 15),
('Mechanical Keyboard', 'RGB mechanical keyboard', 2299.00, 8),
('USB-C Hub', 'Multi-port USB-C hub', 1499.00, 25),
('Laptop Stand', 'Adjustable laptop stand', 999.00, 4),
('Bluetooth Speaker', 'Portable speaker with deep bass', 1999.00, 10),
('Webcam', 'HD USB webcam', 1299.00, 3),
('Wireless Earbuds', 'Noise-cancelling earbuds', 2999.00, 6),
('Portable SSD', '1TB high-speed SSD', 5999.00, 2);

-- Insert Orders
INSERT INTO Orders (customer_id, order_date, total_amount, status) VALUES
(1, '2025-04-01 10:30:00', 2898.00, 'Delivered'),
(2, '2025-04-03 14:45:00', 1499.00, 'Shipped'),
(3, '2025-04-04 09:20:00', 999.00, 'Pending'),
(4, '2025-04-05 11:00:00', 1999.00, 'Delivered'),
(5, '2025-04-06 16:30:00', 7298.00, 'Delivered'),
(6, '2025-04-07 08:45:00', 1299.00, 'Shipped'),
(2, '2025-04-07 19:20:00', 5999.00, 'Returned');

-- Insert Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 599.00),
(1, 2, 1, 2299.00),
(2, 3, 1, 1499.00),
(3, 4, 1, 999.00),
(4, 5, 1, 1999.00),
(5, 8, 1, 5999.00),
(5, 7, 1, 1299.00),
(6, 6, 1, 1299.00),
(7, 8, 1, 5999.00);

-- Insert Payments
INSERT INTO Payments (order_id, payment_date, amount, payment_method, payment_status) VALUES
(1, '2025-04-01 11:00:00', 2898.00, 'Card', 'Completed'),
(2, '2025-04-03 15:00:00', 1499.00, 'UPI', 'Completed'),
(3, '2025-04-04 09:45:00', 999.00, 'Cash On Delivery', 'Pending'),
(4, '2025-04-05 11:15:00', 1999.00, 'Card', 'Completed'),
(5, '2025-04-06 17:00:00', 7298.00, 'Card', 'Completed'),
(6, '2025-04-07 09:00:00', 1299.00, 'UPI', 'Completed');

-- Insert Shipments
INSERT INTO Shipments (order_id, shipment_date, delivery_date, courier_service, tracking_number) VALUES
(1, '2025-04-01 13:00:00', '2025-04-03 16:30:00', 'BlueDart', 'BD123456789'),
(2, '2025-04-03 18:00:00', NULL, 'Delhivery', 'DL987654321'),
(4, '2025-04-05 14:00:00', '2025-04-06 17:45:00', 'Ecom Express', 'EC123456789'),
(5, '2025-04-06 19:00:00', '2025-04-08 13:30:00', 'FedEx', 'FX987654321'),
(6, '2025-04-07 11:00:00', NULL, 'Delhivery', 'DL654321987'),
(7, '2025-04-08 08:00:00', NULL, 'BlueDart', 'BD456789123');
