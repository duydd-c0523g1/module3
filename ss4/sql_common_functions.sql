-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT subject_name, MAX(m.mark) AS "highest_score"
FROM mark m
JOIN subjects s ON s.subject_id = m.subject_id
GROUP BY subject_name;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT subject_id, subject_name, subject_status, MAX(credit) AS "credit"
FROM subjects
GROUP BY subject_id
ORDER BY credit DESC
LIMIT 1;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT m.student_id,s.student_name, avg(m.mark) AS mark
FROM mark m
JOIN students s
ON m.student_id = s.student_id
GROUP BY m.student_id
ORDER BY mark DESC;
