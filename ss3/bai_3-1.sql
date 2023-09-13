CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE Class(

         ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          ClassName VARCHAR(60) NOT NULL,

          StartDate DATETIME NOT NULL,

          Status BIT

);

CREATE TABLE Student(

          StudentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          StudentName VARCHAR(30) NOT NULL,

          Address VARCHAR(50),

          Phone VARCHAR(20),

          Status BIT,

          ClassId INT NOT NULL,

          FOREIGN KEY (ClassId) REFERENCES Class (ClassID)

);

CREATE TABLE Subject(

         SubId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

         SubName VARCHAR(30) NOT NULL,

         Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),

         Status BIT DEFAULT 1

);

CREATE TABLE Mark(

        MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

        SubId INT NOT NULL,

        StudentId INT NOT NULL,

        Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),

        ExamTimes TINYINT DEFAULT 1,

        UNIQUE (SubId, StudentId),

        FOREIGN KEY (SubId) REFERENCES Subject (SubId),

        FOREIGN KEY (StudentId) REFERENCES Student (StudentId)

 );
 
 SELECT 
    StudentName
FROM
    Student
WHERE
    StudentName LIKE 'h%';
    
SELECT 
    StartDate
FROM
    Class
WHERE
    StartDate LIKE '%12%';
    
SELECT 
    Credit
FROM
    Subject
WHERE
    Credit BETWEEN 3 AND 5;
    
UPDATE Student 
SET 
    ClassId = 2
WHERE
    StudentName = 'hung';
    
SELECT 
    s.StudentName, sj.SubName, m.Mark
FROM
    Student
        JOIN
    Mark AS m ON m.StudentId = s.StudentId
        JOIN
    Subject AS sj ON m.SubId = sj.SubId
ORDER BY mark DESC