USE case_study_1;

SELECT employee_name
FROM employees
WHERE CHAR_LENGTH(employee_name) <= 15 AND employee_name REGEXP "^(h|k|t)";

SELECT FLOOR(DATEDIFF(CURDATE(), dob) / 365) AS age, employee_name, address
FROM employees
WHERE FLOOR(DATEDIFF(CURDATE(), dob) / 365) BETWEEN 18 AND 50 AND (address LIKE "%quảng trị%" OR address LIKE "%đà nẵng%");

SELECT c.customer_name, COUNT(c.customer_id) AS "time_booked"
FROM customers c
JOIN customer_type ct ON c.customer_type_id = ct.type_id
JOIN contracts con ON c.customer_id = con.customer_id
WHERE ct.type_name = "diamond"
GROUP BY c.customer_name
ORDER BY COUNT(c.customer_id);

SELECT
    c.customer_id,
    c.customer_name,
    ct.type_name AS customer_type,
    con.contract_id,
    s.service_name,
    con.start_date,
    con.end_date,
    (IFNULL(s.rental_fee, 0) + SUM(IFNULL(dc.quantity, 0) * IFNULL(asv.asv_price, 0))) AS total_price
FROM customers c
JOIN customer_type ct ON c.customer_type_id = ct.type_id
LEFT JOIN contracts con ON c.customer_id = con.customer_id
LEFT JOIN services s ON con.service_id = s.service_id
LEFT JOIN detailed_contracts dc ON con.contract_id = dc.contract_id
LEFT JOIN additional_services asv ON dc.asv_id = asv.asv_id
GROUP BY c.customer_id, con.contract_id
ORDER BY c.customer_id;
