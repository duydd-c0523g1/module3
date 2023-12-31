CREATE TABLE job_position (
  position_id INT AUTO_INCREMENT PRIMARY KEY,
  position_name VARCHAR(45) UNIQUE
);

CREATE TABLE academic_level (
  level_id INT AUTO_INCREMENT PRIMARY KEY,
  level_name VARCHAR(45) UNIQUE
);

CREATE TABLE department (
  department_id INT AUTO_INCREMENT PRIMARY KEY,
  department_name VARCHAR(45) UNIQUE
);

CREATE TABLE employees (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_name VARCHAR(45),
  dob DATE,
  identity_number VARCHAR(45) UNIQUE,
  salary DOUBLE,
  phone_number VARCHAR(45) UNIQUE,
  email VARCHAR(45) UNIQUE,
  address VARCHAR(45),
  position_id INT,
  level_id INT,
  department_id INT,
  FOREIGN KEY (position_id) REFERENCES job_position(position_id),
  FOREIGN KEY (level_id) REFERENCES academic_level(level_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE customer_type (
  type_id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(45) UNIQUE
);

CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_type_id INT,
  customer_name VARCHAR(45),
  dob DATE,
  gender BIT,
  identity_number VARCHAR(45) UNIQUE,
  phone_number VARCHAR(45) UNIQUE,
  email VARCHAR(45),
  address VARCHAR(45),
  FOREIGN KEY (customer_type_id) REFERENCES customer_type(type_id)
);

CREATE TABLE rental_type (
  type_id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(45) UNIQUE
);

CREATE TABLE service_type (
  type_id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(45) UNIQUE
);

CREATE TABLE services (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  service_name VARCHAR(50),
  service_area INT,
  rental_fee DOUBLE,
  max_user INT,
  room_standard VARCHAR(45),
  rental_type_id INT,
  service_type_id INT,
  room_equipments VARCHAR(45),
  additional_service TEXT,
  pool_area DOUBLE,
  total_floor INT,
  FOREIGN KEY (rental_type_id) REFERENCES rental_type(type_id),
  FOREIGN KEY (service_type_id) REFERENCES service_type(type_id)
);

CREATE TABLE additional_services (
  asv_id INT AUTO_INCREMENT PRIMARY KEY,
  asv_name VARCHAR(45) UNIQUE,
  asv_price DOUBLE,
  asv_unit VARCHAR(10),
  asv_status VARCHAR(45)
);

CREATE TABLE contracts (
  contract_id INT AUTO_INCREMENT PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  deposit DOUBLE,
  employee_id INT,
  customer_id INT,
  service_id INT,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (service_id) REFERENCES services(service_id)
);

CREATE TABLE detailed_contracts (
  detailed_contract_id INT AUTO_INCREMENT PRIMARY KEY,
  contract_id INT,
  asv_id INT,
  quantity INT,
  FOREIGN KEY (contract_id) REFERENCES contracts(contract_id),
  FOREIGN KEY (asv_id) REFERENCES additional_services(asv_id)
);