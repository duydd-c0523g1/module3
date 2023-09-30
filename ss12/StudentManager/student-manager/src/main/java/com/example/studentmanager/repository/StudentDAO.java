package com.example.studentmanager.repository;

import com.example.studentmanager.model.Student;

import java.util.List;

public class StudentDAO implements IStudentDAO {
    private final String JDBC_URL = "jdbc:mysql://localhost:3306/?user=root";
    private final String JDBC_USERNAME = "root";
    private final String JDBC_PASSWORD = "Duylatao12345";
    @Override
    public List<Student> displayStudent() {
        return null;
    }

    @Override
    public List<Student> sortByName() {
        return null;
    }

    @Override
    public List<Student> findStudentByName(String name) {
        return null;
    }

    @Override
    public void deleteStudent(int id) {

    }

    @Override
    public Student findStudentByID(int id) {
        return null;
    }

    @Override
    public void addStudent(Student student) {

    }

    @Override
    public void editStudent(Student student) {

    }
}
