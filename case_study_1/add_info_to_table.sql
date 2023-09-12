INSERT INTO job_position(position_name)
VALUES("Manager"), ("Employee");

INSERT INTO academic_level(level_name)
VALUES("Intermediate"), ("College"), ("University"), ("After University");

INSERT INTO department(department_name)
VALUES("Sale-Marketing"), ("Administration"), ("Service"), ("Manage");

INSERT INTO employees(employee_name, dob, identity_number, salary, phone_number, email, address, position_id, level_id, department_id)
VALUES	("Nguyễn Văn An", "1970-11-07", "456231786", 10000000, "0901234121", "annguyen@gmail.com", "295 Nguyễn Tất Thành, Đà Nẵng", 1, 3, 1), 
		("Lê Văn Bình", "1997-04-09", "654231234", 7000000, "0934212314", "binhlv@gmail.com", "22 Yên Bái, Đà Nẵng", 1, 2, 2),
        ("Hồ Thị Yến", "1995-12-12", "999231723", 14000000, "0412352315", "thiyen@gmail.com", "K234/11 Điện Biên Phủ, Gia Lai", 1, 3, 2),
        ("Võ Công Toản", "1980-04-04", "123231365", 17000000, "0374443232", "toan0404@gmail.com", "77 Hoàng Diệu, Quảng Trị", 1, 4, 4);
        
INSERT INTO customer_type(type_name)
VALUES("Diamond"), ("Platinum"), ("Gold"), ("Silver"), ("Member");

INSERT INTO customers(customer_type_id, customer_name, dob, gender, identity_number, phone_number, email, address)
VALUES	(5, "Nguyễn Thị Hào", "1970-11-07", 0, "643431213", "0945423362", "thihao07@gmail.com", "23 Nguyễn Hoàng, Đà Nẵng"), 
		(3, "Phạm Xuân Diệu", "1992-08-08", 1, "865342123", "0954333333", "xuandieu92@gmail.com", "K77/22 Thái Phiên, Quảng Trị"), 
		(1, "Trương Đình Nghệ", "1990-02-27", 1, "488645199", "0373213122", "nghenhan2702@gmail.com", "K323/12 Ông Ích Khiêm, Vinh"), 
		(3, "Nguyễn Mỹ Kim", "1984-04-08", 0, "856453123", "0912345698", "kimcuong84@gmail.com", "K123/45 Lê Lợi, Hồ Chí Minh");
        
INSERT INTO rental_type(type_name)
VALUES("Year"), ("Month"), ("Day"), ("Hour");

INSERT INTO service_type(type_name)
VALUES("Villa"), ("House"), ("Room");

INSERT INTO services(service_name, service_area, rental_fee, max_user, rental_type_id, service_type_id, room_equipments, additional_service, pool_area, total_floor)
VALUES	("Villa Beach Front", 25000, 1000000, 10, 3, 1, "Có hồ bơi", NULL, 500, 4),
    	("House Princess 02", 10000, 4000000, 5, 3, 1, "Có thêm bếp nướng", NULL, NULL, 2),
		("House Princess 01", 14000, 5000000, 7, 3, 2, "Có thêm bếp nướng", NULL, NULL, 3);
        
INSERT INTO additional_services(as_name, as_price, as_unit, as_status)
VALUES	("Karaoke", 10000, "Hour", "Available"), 
		("Motorbike Rental", 10000, "Each", "1 unavailable"), 
        ("Bycicle Rental", 20000, "Each", "Good"), 
        ("Breakfast Buffet", 150000, "Ticket", "Good"),
        ("Lunch Buffet", 200000, "Ticket", "Good"),
        ("Dinner Buffet", 250000, "Ticket", "Good");

INSERT INTO contracts(start_date, end_date, deposit, employee_id, customer_id, service_id)
VALUES	("2020-12-08", "2020-12-08", 0, 1, 1, 3),
		("2020-07-14", "2020-07-21", 200000, 2, 2, 3),
		("2020-12-08", "2021-03-17", 50000, 3, 3, 3),
		("2021-01-14", "2021-01-18", 100000, 4, 4, 3);

INSERT INTO detailed_contracts(quantity, contract_id, as_id)
VALUES	(5, 2, 4),
		(8, 2, 5),
		(15, 2, 6),
		(6, 4, 6),
		(1, 3, 1);