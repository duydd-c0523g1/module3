-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT 
    customer_name, asv.asv_name
FROM
    customers cus
        JOIN
    contracts con ON cus.customer_id = con.customer_id
        JOIN
    detailed_contracts dc ON dc.contract_id = con.contract_id
        JOIN
    additional_services asv ON dc.asv_id = asv.asv_id
WHERE
    customer_type_id = 1
        AND (cus.address LIKE '%Vinh'
        OR cus.address LIKE '%Quảng Ngãi');
        
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách 

SELECT 
    con.contract_id,
    emp.employee_name,
    cus.customer_name,
    cus.phone_number,
    ser.service_name,
    SUM(IFNULL(dc.quantity, 0)) AS 'number_of_services',
    con.deposit
FROM
    contracts con
        JOIN
    employees emp ON con.employee_id = emp.employee_id
        LEFT JOIN
    customers cus ON con.customer_id = cus.customer_id
        LEFT JOIN
    services ser ON con.service_id = ser.service_id
        LEFT JOIN
    detailed_contracts dc ON con.contract_id = dc.contract_id
WHERE
    QUARTER(con.start_date) = 4
        AND YEAR(con.start_date) = 2020
        AND NOT (YEAR(con.start_date) = 2021
        AND QUARTER(con.start_date) = 1
        AND QUARTER(con.start_date) = 2)
GROUP BY con.contract_id;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

SELECT 
    asv.asv_id, SUM(dc.quantity) AS 'time_used', asv.asv_name
FROM
    additional_services asv
        JOIN
    detailed_contracts dc ON asv.asv_id = dc.asv_id
        LEFT JOIN
    contracts con ON dc.contract_id = con.contract_id
        LEFT JOIN
    customers cus ON con.customer_id = cus.customer_id
GROUP BY asv.asv_id
ORDER BY time_used DESC
LIMIT 2;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).

SELECT 
    con.contract_id, st.type_name, asv.asv_name
FROM
    contracts con
        JOIN
    services ser ON con.service_id = ser.service_id
        JOIN
    service_type st ON ser.service_type_id = st.type_id
        JOIN
    detailed_contracts dc ON con.contract_id = dc.contract_id
        JOIN
    additional_services asv ON dc.asv_id = asv.asv_id
WHERE
    asv.asv_id IN (SELECT 
            asv.asv_id
        FROM
            contracts con
                JOIN
            detailed_contracts dc ON con.contract_id = dc.contract_id
                LEFT JOIN
            additional_services asv ON dc.asv_id = asv.asv_id
                LEFT JOIN
            services ser ON con.service_id = ser.service_id
                LEFT JOIN
            service_type st ON ser.service_type_id = st.type_id
        GROUP BY dc.asv_id
        HAVING COUNT(dc.asv_id) = 1);


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

SELECT 
    emp.employee_id,
    emp.employee_name,
    aca.level_name,
    dep.department_name,
    emp.phone_number,
    emp.address
FROM
    employees emp
        JOIN
    contracts con ON emp.employee_id = con.employee_id
        JOIN
    academic_level aca ON emp.level_id = aca.level_id
        JOIN
    department dep ON emp.department_id = dep.department_id
WHERE
    (YEAR(con.start_date) BETWEEN 2020 AND 2021)
GROUP BY con.employee_id
HAVING COUNT(con.employee_id) <= 3;