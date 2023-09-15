CREATE TABLE products(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_code VARCHAR(10) NOT NULL,
product_name VARCHAR (50) NOT NULL,
product_price INT DEFAULT 0,
product_amount INT DEFAULT 0,
product_description TEXT,
product_status BIT DEFAULT 1
);

INSERT INTO products(product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES  ("HEADPHONE", "G733-Light Speed", 2400000, 1, "LIMITED EDITION", 1),
		("HEADPHONE", "G733-ProX", 3000000, 1, "BLACK", 1),
		("GMOUSE", "G902 Wireless", 2000000, 1, "BLACK", 1),
		("GPU", "RTX-4090 TI", 35000000, 1, "FOUNDER EDITION", 1),
		("GPU", "RTX-3060 TI", 18000000, 1, "FOUNDER EDITION", 1),
		("GCHAIR", "DX-RACER", 15000000, 1, "Unassembled", 1);
        
CREATE UNIQUE INDEX products_index
ON products(product_name, product_price);
EXPLAIN SELECT *
FROM products
WHERE product_name = "G733-Light Speed" OR product_price = 35000000;
SELECT *
FROM products
WHERE product_name = "G733-Light Speed" OR product_price = 35000000;
set sql_safe_updates =0;
CREATE VIEW product_view AS
SELECT product_code, product_name, product_price, product_status
FROM products;
UPDATE product_view
SET product_status = 1
WHERE product_status = 0;
DROP VIEW product_view;

delimiter //
CREATE PROCEDURE get_product_info(keyword VARCHAR(50))
BEGIN
SELECT *
FROM products
WHERE product_name = keyword;
END //
delimiter ;
CALL get_product_info("G733-Light Speed");

delimiter //
CREATE PROCEDURE add_new_product(p_code VARCHAR(10), 
p_name VARCHAR (50), 
p_price INT, 
p_amount INT, 
p_description TEXT, 
p_status BIT)
BEGIN
INSERT INTO products(product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES (p_code, p_name, p_price, p_amount, p_description, p_status);
END //
delimiter ;
CALL add_new_product("CPU", "Intel Core i9 10900K", 10000000, 1, "10th Gen", 1);

delimiter //
CREATE PROCEDURE update_product_by_id(id INT, 
p_code VARCHAR(10), 
p_name VARCHAR (50), 
p_price INT, 
p_amount INT, 
p_description TEXT, 
p_status BIT)
BEGIN
UPDATE products
SET product_code = p_code, 
	product_name = p_name, 
	product_price = p_price, 
    product_amount = p_amount, 
    product_description = p_description, 
    product_status = p_status
WHERE product_id = id;
END //
delimiter ;
CALL update_product_by_id (7, "CPU", "Intel Core i9 9900K", 95000000, 1, "9th Gen", 1);

delimiter //
CREATE PROCEDURE remove_product_by_id(id INT)
BEGIN
DELETE
FROM products
WHERE product_id = id;
END //
delimiter ;
CALL remove_product_by_id(7);