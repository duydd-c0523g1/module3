CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(50),
customer_age INT
);

CREATE TABLE products(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50),
product_price DOUBLE
);

CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id VARCHAR(50),
order_date DATE,
order_total DOUBLE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details(
order_id INT,
product_id INT,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES orders(product_id)
);