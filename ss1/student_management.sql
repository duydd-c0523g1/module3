USE student_management;

CREATE TABLE Students(
id int primary key auto_increment,
student_name VARCHAR(50),
age int,
country VARCHAR(50)
);

INSERT INTO Students(student_name, age, country)
VALUES ('Dao Duc Duy', 25, 'Vietnam'), ('Nguyen Van A', 2, 'Vietnam'), ('Elon Musk',60,'Vietnam');

CREATE TABLE Class(
id int primary key auto_increment,
class_name varchar(50)
);

INSERT INTO Class(class_name)
VALUES ('C0623G1'), ('C0723G1'), ('C0623G1');

CREATE TABLE Teachers(
	id int primary key auto_increment,
    teacher_name varchar(50),
    age int,
    country varchar(50)
);

INSERT INTO Teachers(teacher_name, age, country)
VALUES ('Teacher A', 21, 'Vietnam'), ('Teacher B', 27, 'Vietnam'), ('Teacher C',40,'India');