CREATE TABLE job_position(
position_id INT PRIMARY KEY AUTO_INCREMENT,
position_name VARCHAR(80)
);

CREATE TABLE academic_level(
level_id INT PRIMARY KEY AUTO_INCREMENT,
level_name VARCHAR(100)
);

CREATE TABLE department(
department_id INT PRIMARY KEY AUTO_INCREMENT,
department_name VARCHAR(100)
);

CREATE TABLE employees(
employee_id INT PRIMARY KEY AUTO_INCREMENT,
employee_name VARCHAR(50),
dob VARCHAR(100),
identity_number VARCHAR(12),
salary DECIMAL(5, 2),
phone_number INT(11),
email VARCHAR(100),
address VARCHAR(100)
-- position_id
-- level_id
-- department_id
);

CREATE TABLE customer_type(
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR(20)
);

CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(50),
dob VARCHAR(100),
gender BIT,
identity_number VARCHAR(12),
salary DECIMAL(5, 2),
phone_number INT(11),
email VARCHAR(100),
address VARCHAR(100)
-- type_id
);

CREATE TABLE rental_type(
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR(10)
);

CREATE TABLE service_type(
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR(20)
);

CREATE TABLE services(
service_id INT PRIMARY KEY AUTO_INCREMENT,
service_name VARCHAR(50),
service_area DECIMAL(5, 2),
rental_fee DECIMAL(5, 2),
max_user INT,
room_equipments VARCHAR(100),
additional_service VARCHAR(50),
pool_area INT,
total_floor INT,
additional_service VARCHAR(50)
-- rental_type_id
-- service_type_id
);

CREATE TABLE additional_services(
as_id INT PRIMARY KEY AUTO_INCREMENT,
as_name VARCHAR(50),
as_price DECIMAL(3, 1),
as_unit VARCHAR(10),
as_status VARCHAR(50)
);

CREATE TABLE contracts(
contract_id INT PRIMARY KEY AUTO_INCREMENT,
start_date DATE,
end_date DATE,
deposit DECIMAL(5, 2)
-- employee_id
-- customer_id
-- service_id
);

CREATE TABLE detailed_contracts(
contract_id INT PRIMARY KEY AUTO_INCREMENT,
quantity INT
);