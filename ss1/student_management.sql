USE student_management;

CREATE TABLE Students(
id int primary key auto_increment,
student_name VARCHAR(50),
age int,
country VARCHAR(50)
);

CREATE TABLE Class(
id int primary key auto_increment,
class_name varchar(50)
);

CREATE TABLE Teachers(
	id int primary key auto_increment,
    teacher_name varchar(50),
    age int,
    country varchar(50)
);