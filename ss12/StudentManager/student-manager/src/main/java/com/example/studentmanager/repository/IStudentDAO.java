package com.example.studentmanager.repository;

import com.example.studentmanager.model.Student;

import java.util.List;

public interface IStudentDAO {
    List<Student> displayStudent();
    List<Student> sortByName();
    List<Student> findStudentByName(String name);
    void deleteStudent(int id);
    Student findStudentByID(int id);
    void addStudent(Student student);
    void editStudent(Student student);
}
