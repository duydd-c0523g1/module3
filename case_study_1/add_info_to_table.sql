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
        ("Võ Công Toản", "1980-04-04", "123231365", 17000000, "0374443232", "toan0404@gmail.com", "77 Hoàng Diệu, Quảng Trị", 1, 4, 4),
        ("Nguyễn Bỉnh Phát", "1999-12-09", "454363232", 6000000, "0902341231", "phatphat@gmail.com", "43 Yên Bái, Đà Nẵng", 2, 1, 1),
        ("Khúc Nguyễn An Nghi", "2000-11-08", "964542311", 7000000, "0978653213", "annghi20@gmail.com", "294 Nguyễn Tất Thành, Đà Nẵng", 2, 2, 3),
        ("Nguyễn Hữu Hà", "1993-01-01", "534323231", 8000000, "0941234553", "nhh0101@gmail.com", "4 Nguyễn Chí Thanh, Huế", 2, 3, 2),
        ("Nguyễn Hà Đông", "1989-09-03", "234414123", 9000000, "0642123111", "donghanguyen@gmail.com", "111 Hùng Vương, Hà Nội", 2, 4, 4),
        ("Tòng Hoang", "1982-09-03", "256781231", 6000000, "0245144444", "hoangtong@gmail.com", "213 Hàm Nghi, Đà Nẵng", 2, 4, 4),
        ("Nguyễn Công Đạo", "1994-01-08", "755434343", 8000000, "0988767111", "nguyencongdao12@gmail.com", "6 Hoà Khánh, Đồng Nai", 2, 3, 2);
        
INSERT INTO customer_type(type_name)
VALUES("Diamond"), ("Platinum"), ("Gold"), ("Silver"), ("Member");

INSERT INTO customers(customer_type_id, customer_name, dob, gender, identity_number, phone_number, email, address)
VALUES	(5, "Nguyễn Thị Hào", "1970-11-07", 0, "643431213", "0945423362", "thihao07@gmail.com", "23 Nguyễn Hoàng, Đà Nẵng"), 
		(3, "Phạm Xuân Diệu", "1992-08-08", 1, "865342123", "0954333333", "xuandieu92@gmail.com", "K77/22 Thái Phiên, Quảng Trị"), 
		(1, "Trương Đình Nghệ", "1990-02-27", 1, "488645199", "0373213122", "nghenhan2702@gmail.com", "K323/12 Ông Ích Khiêm, Vinh"), 
		(1, "Dương Văn Quan", "1981-07-08", 1, "543432111", "0490039241", "duongquan@gmail.com", "K453/12 Lê Lợi, Đà Nẵng"), 
		(4, "Hoàng Trần Nhi Nhi", "1995-12-09", 0, "795453345", "0312345678", "nhinhi123@gmail.com", "224 Lý Thái Tổ, Gia Lai"), 
		(4, "Tôn Nữ Mộc Châu", "2005-12-06", 0, "732434215", "0988888844", "tonnuchau@gmail.com", "37 Yên Thế, Đà Nẵng"), 
		(1, "Nguyễn Mỹ Kim", "1984-04-08", 0, "856453123", "0912345698", "kimcuong84@gmail.com", "K123/45 Lê Lợi, Hồ Chí Minh"), 
		(3, "Nguyễn Thị Hào", "1999-04-08", 0, "965656433", "0763212345", "haohao99@gmail.com", "55 Nguyễn Văn Linh, Kon Tum"), 
		(1, "Trần Đại Danh", "1990-02-27", 1, "432341235", "0643343433", "danhhai99@gmail.com", "24 Lý Thường Kiệt, Quảng Ngãi"), 
		(2, "Nguyễn Tâm Đắc", "1989-07-01", 1, "344343432", "0987654321", "dactam@gmail.com", "22 Ngô Quyền, Đà Nẵng");
        
INSERT INTO rental_type(type_name)
VALUES("Year"), ("Month"), ("Day"), ("Hour");

INSERT INTO service_type(type_name)
VALUES("Villa"), ("House"), ("Room");

INSERT INTO services(service_name, service_area, rental_fee, max_user, room_standard, room_equipments, pool_area, total_floor, additional_service, rental_type_id, service_type_id)
VALUES	("Villa Beach Front", 2500, 1000000, 10, "VIP", "Swimming pool", 500, 4, NULL, 3, 1),
		("House Princess 01", 14000, 5000000, 7, "VIP", "BBQ", NULL, 3, NULL, 2, 2),
		("Room Twin 01", 5000, 1000000, 2, "Normal", "Television", NULL, NULL, "01 Motorbike, 01 Bicycle", 4, 3),
		("Villa No Beach Front", 22000, 9000000, 8, "Normal", "Swimming pool", 300, 3, NULL, 3, 1),
		("House Princess 02", 10000, 4000000, 5, "VIP", "BBQ", NULL, 2, NULL, 3, 2),
		("Room Twin 02", 3000, 900000, 2, "Normal", "Television", NULL, NULL, "01 Motorbike", 4, 3);
        
INSERT INTO additional_services(as_name, as_price, as_unit, as_status)
VALUES	("Karaoke", 10000, "Hour", "Available"), 
		("Motorbike Rental", 10000, "Each", "1 unavailable"), 
        ("Bicycle Rental", 20000, "Each", "Good"), 
        ("Breakfast Buffet", 150000, "Ticket", "Good"),
        ("Lunch Buffet", 200000, "Ticket", "Good"),
        ("Dinner Buffet", 250000, "Ticket", "Good");

INSERT INTO contracts(start_date, end_date, deposit, employee_id, customer_id, service_id)
VALUES	("2020-12-08", "2020-12-08", 0, 3, 1, 3),
		("2020-07-14", "2020-07-21", 200000, 7, 3, 1),
		("2021-03-15", "2021-03-17", 50000, 3, 4, 2),
		("2021-01-14", "2021-01-18", 100000, 7, 5, 5),
		("2021-07-14", "2021-07-15", 0, 7, 2, 6),
		("2021-06-01", "2021-06-03", 0, 7, 7, 6),
		("2021-04-12", "2021-04-14", 0, 10, 3, 5),
		("2021-09-02", "2021-09-05", 100000, 7, 4, 4),
		("2021-06-17", "2021-06-18", 150000, 3, 4, 1),
		("2020-11-19", "2020-11-19", 0, 3, 4, 3),
		("2021-04-25", "2021-04-25", 0, 2, 2, 1),
		("2021-05-25", "2021-05-27", 0, 7, 10, 1);

INSERT INTO detailed_contracts(quantity, contract_id, as_id)
VALUES	(5, 2, 4),
		(8, 2, 5),
		(15, 2, 6),
		(1, 3, 1),
		(11, 3, 2),
		(1, 1, 3),
		(2, 1, 2),
		(2, 12, 2);