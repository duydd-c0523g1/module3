CREATE TABLE customers (
    c_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(25) NOT NULL,
    c_age TINYINT NOT NULL
);

CREATE TABLE orders (
    o_id INT PRIMARY KEY AUTO_INCREMENT,
    c_id INT NOT NULL,
    o_date DATE NOT NULL,
    o_total INT,
    FOREIGN KEY (c_id)
        REFERENCES customers (c_id)
);

CREATE TABLE products (
    p_id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(25) NOT NULL,
    p_price INT
);

CREATE TABLE order_details (
    o_id INT,
    p_id INT,
    o_qty INT NOT NULL,
    UNIQUE (o_id, o_id),
    FOREIGN KEY (o_id)
        REFERENCES orders (o_id),
    FOREIGN KEY (p_id)
        REFERENCES products (p_id)
);

INSERT INTO customers(c_name, c_age)
VALUES  ("Minh Quan",  10),
		("Ngoc Oanh", 20),
        ("Hong Ha", 50);
        
INSERT INTO orders(c_id, o_date, o_total)
VALUES  (1, "2006-12-21", NULL),
		(2, "2006-03-23", NULL),
		(1, "2006-03-16", NULL);
        
INSERT INTO products(p_name, p_price)
VALUES  ("May Giat", 3),
		("Tu Lanh", 5),
		("Dieu Hoa", 7),
		("Quat", 1),
		("Bep Dien", 2);
		
INSERT INTO order_details(o_id, p_id, o_qty)
VALUES 	(1,1,3),
		(1,3,7),
		(1,4,2),
		(2,1,1),
		(3,1,8),
		(2,5,4),
		(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT o_id, o_date, o_total FROM orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT orders.o_id, customers.c_name FROM orders
JOIN customers ON orders.c_id = customers.c_id;


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT orders.o_id, customers.c_name FROM orders
JOIN customers ON orders.c_id = customers.c_id
WHERE orders.o_id IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT orders.o_id, orders.o_date,
       SUM(order_details.o_qty * products.p_price) AS TotalPrice
FROM orders
JOIN order_details ON orders.o_id = order_details.o_id
JOIN products ON order_details.p_id = products.p_id
GROUP BY orders.o_id, orders.o_date;