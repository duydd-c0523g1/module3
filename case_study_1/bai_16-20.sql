set sql_safe_updates =0;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

ALTER TABLE employees
ADD to_delete BIT DEFAULT 0;

UPDATE employees
SET to_delete = 1
WHERE employee_id NOT IN (
    SELECT emp.employee_id
    FROM (
        SELECT emp.employee_id
        FROM employees emp
        LEFT JOIN contracts con
        ON emp.employee_id = con.employee_id
        WHERE YEAR(con.start_date) BETWEEN 2019 AND 2021
    ) AS emp
);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

CREATE VIEW platinum_customers AS
SELECT con.customer_id
FROM contracts con
LEFT JOIN services ser
ON con.service_id= ser.service_id
LEFT JOIN detailed_contracts dc
ON con.contract_id = dc.contract_id
LEFT JOIN additional_services asv
ON asv.asv_id = dc.asv_id
LEFT JOIN customers cus
ON con.customer_id = cus.customer_id
LEFT JOIN customer_type ct
ON cus.customer_type_id = ct.type_id
WHERE YEAR(con.start_date) = 2021 AND ct.type_id = 2
GROUP BY con.contract_id
HAVING SUM(IFNULL((asv.asv_price * dc.quantity),0) + IFNULL(ser.rental_fee, 0)) > 10000000;
-- ---------------
UPDATE customers cus
JOIN platinum_customers pc
ON cus.customer_id = pc.customer_id
SET cus.customer_type_id = 1;

-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

ALTER TABLE customers
ADD to_delete BIT DEFAULT 0;

UPDATE customers
SET to_delete = 1
WHERE customer_id NOT IN (
    SELECT cus.customer_id
    FROM (
        SELECT cus.customer_id
        FROM customers cus
        LEFT JOIN contracts con
        ON cus.customer_id = con.customer_id
        WHERE YEAR(con.start_date) < 2021
    ) AS cus
);

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
UPDATE additional_services asv
SET asv.asv_price = asv.asv_price * 2
WHERE asv.asv_id IN (
    SELECT asv.asv_id
    FROM (
        SELECT asv.asv_id
        FROM contracts con
        JOIN detailed_contracts dc
        ON dc.contract_id = con.contract_id
        JOIN additional_services asv
        ON asv.asv_id = dc.asv_id
        WHERE YEAR(con.start_date) = 2020
        GROUP BY asv.asv_id
        HAVING (SUM(dc.quantity) > 10)
    ) AS new_price
);

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT emp.employee_id AS 'id',
emp.employee_name AS 'name',
emp.email,
emp.phone_number,
emp.dob,
emp.address
FROM employees emp
UNION ALL
SELECT cus.customer_id,
cus.customer_name,
cus.email,
cus.phone_number,
cus.dob,
cus.address
FROM customers cus;