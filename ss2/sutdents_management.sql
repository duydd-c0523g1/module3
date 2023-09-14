CREATE TABLE classes(
class_id INT PRIMARY KEY AUTO_INCREMENT,
class_name VARCHAR(60) NOT NULL,
start_date DATE NOT NULL,
class_status BIT
);

CREATE TABLE students(
student_id INT PRIMARY KEY AUTO_INCREMENT,
student_name VARCHAR(30) NOT NULL,
address VARCHAR(50),
phone VARCHAR(20),
student_status BIT,
class_id INT NOT NULL,
FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

CREATE TABLE subjects(
subject_id INT PRIMARY KEY AUTO_INCREMENT,
subject_name VARCHAR(30) NOT NULL,
credit TINYINT NOT NULL DEFAULT 1 CHECK(credit >= 1),
subject_status BIT DEFAULT 1
);

CREATE TABLE mark(
mark_id INT PRIMARY KEY AUTO_INCREMENT,
subject_id INT NOT NULL,
student_id INT NOT NULL,
mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
exam_time TINYINT DEFAULT 1,
UNIQUE (subject_id, student_id),
FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
FOREIGN KEY (student_id) REFERENCES students(student_id)
);