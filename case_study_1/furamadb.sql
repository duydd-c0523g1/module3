CREATE TABLE job_position (
  position_id INT AUTO_INCREMENT PRIMARY KEY,
  position_name VARCHAR(80)
);

CREATE TABLE academic_level (
  level_id INT AUTO_INCREMENT PRIMARY KEY,
  level_name VARCHAR(100)
);

CREATE TABLE department (
  department_id INT AUTO_INCREMENT PRIMARY KEY,
  department_name VARCHAR(100)
);

CREATE TABLE employees (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_name VARCHAR(50),
  dob DATE,
  identity_number VARCHAR(12),
  salary DECIMAL(5, 2),
  phone_number VARCHAR(11),
  email VARCHAR(100),
  address VARCHAR(100),
  position_id INT,
  level_id INT,
  department_id INT,
  FOREIGN KEY (position_id) REFERENCES job_position(position_id),
  FOREIGN KEY (level_id) REFERENCES academic_level(level_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE customer_type (
  type_id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(20)
);

CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(50),
  dob DATE,
  gender BIT,
  identity_number VARCHAR(12),
  salary DECIMAL(5, 2),
  phone_number VARCHAR(11),
  email VARCHAR(100),
  address VARCHAR(100),
  customer_type_id INT,
  FOREIGN KEY (customer_type_id) REFERENCES customer_type(type_id)
);

CREATE TABLE rental_type (
  type_id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(10)
);

CREATE TABLE service_type (
  type_id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(20)
);

CREATE TABLE services (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  service_name VARCHAR(50),
  service_area DECIMAL(5, 2),
  rental_fee DECIMAL(5, 2),
  max_user INT,
  room_equipments VARCHAR(100),
  additional_service VARCHAR(50),
  pool_area INT,
  total_floor INT,
  rental_type_id INT,
  service_type_id INT,
  FOREIGN KEY (rental_type_id) REFERENCES rental_type(type_id),
  FOREIGN KEY (service_type_id) REFERENCES service_type(type_id)
);

CREATE TABLE additional_services (
  as_id INT AUTO_INCREMENT PRIMARY KEY,
  as_name VARCHAR(50),
  as_price DECIMAL(3, 1),
  as_unit VARCHAR(10),
  as_status VARCHAR(50)
);

CREATE TABLE contracts (
  contract_id INT AUTO_INCREMENT PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  deposit DECIMAL(5, 2),
  employee_id INT,
  customer_id INT,
  service_id INT,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (service_id) REFERENCES services(service_id)
);

CREATE TABLE detailed_contracts (
  contract_id INT AUTO_INCREMENT PRIMARY KEY,
  quantity INT
);
