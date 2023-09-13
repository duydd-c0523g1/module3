CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(50) NOT NULL,
customer_age INT NOT NULL
);

CREATE TABLE products(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50) NOT NULL,
product_price DOUBLE NOT NULL
);

CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id VARCHAR(50) NOT NULL,
order_date DATE NOT NULL,
order_total DOUBLE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details(
order_id INT,
product_id INT,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES orders(product_id)
);