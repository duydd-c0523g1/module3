package com.example.studentmanager.service;

import com.example.studentmanager.model.Student;
import com.example.studentmanager.repository.IStudentDAO;
import com.example.studentmanager.repository.StudentDAO;

import java.util.List;

public class StudentServiceImpl implements IStudentService {
    private final IStudentDAO studentRepo = new StudentDAO();
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
