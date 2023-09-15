-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

SELECT service_id, 
service_name, 
service_area, 
rental_fee,
type_name
FROM services s
JOIN service_type st
ON s.service_type_id = st.type_id
WHERE s.service_id NOT IN (
SELECT service_id
FROM contracts
WHERE (QUARTER(start_date) = 1)
);

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT service_id, 
service_name, 
service_area, 
max_user, 
rental_fee, 
type_name
FROM services s
JOIN service_type st
ON s.service_type_id = st.type_id
WHERE s.service_id NOT IN(
SELECT service_id
FROM contracts
WHERE (YEAR(start_date) = 2021)
) AND s.service_id IN(
SELECT service_id
FROM contracts
WHERE (YEAR(start_date) = 2020)
);

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- Cách 1:
SELECT DISTINCT customer_name
FROM customers;
-- Cách 2:
SELECT customer_name
FROM customers
GROUP BY customer_name;
-- Cách 3:
SELECT customer_name, COUNT(*) AS "customers_with_this_name"
FROM customers
GROUP BY customer_name;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT MONTH(start_date) AS "month",
COUNT(con.customer_id) AS "time_booked"
FROM contracts con
WHERE YEAR(start_date) = 2021
GROUP BY MONTH(start_date);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT con. contract_id,
start_date,
end_date,
deposit,
SUM(dc.quantity) AS "number_of_services"
FROM contracts con
LEFT JOIN detailed_contracts dc
ON con.contract_id = dc.contract_id
GROUP BY con.contract_id
ORDER BY con.contract_id;