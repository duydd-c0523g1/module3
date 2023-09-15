-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT customer_name,
asv.asv_name
FROM customers cus
JOIN contracts con
ON cus.customer_id = con.customer_id
JOIN detailed_contracts dc
ON dc.contract_id = con.contract_id
JOIN additional_services asv
ON dc.asv_id = asv.asv_id
WHERE customer_type_id = 1 AND (cus.address LIKE "%Vinh" OR cus.address LIKE "%Quảng Ngãi");

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT con.contract_id,
emp.employee_name,
cus.customer_name,
cus.phone_number,
ser.service_name,
SUM(IFNULL(dc.quantity, 0)) AS "number_of_services",
con.deposit
FROM contracts con
JOIN employees emp
ON con.employee_id = emp.employee_id
LEFT JOIN customers cus
ON con.customer_id = cus.customer_id
LEFT JOIN services ser
ON con.service_id = ser.service_id
LEFT JOIN detailed_contracts dc
ON con.contract_id = dc.contract_id
WHERE QUARTER(con.start_date) = 4
AND YEAR(con.start_date) = 2020 
AND NOT (YEAR(con.start_date) = 2021 AND QUARTER(con.start_date) = 1 AND QUARTER(con.start_date) = 2)
GROUP BY con.contract_id;