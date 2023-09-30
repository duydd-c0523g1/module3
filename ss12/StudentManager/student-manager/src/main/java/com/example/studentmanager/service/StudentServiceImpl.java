package com.example.studentmanager.service;

import com.example.studentmanager.model.Student;
import com.example.studentmanager.repository.IStudentDAO;
import com.example.studentmanager.repository.StudentDAO;

import java.util.List;

public class StudentServiceImpl implements IStudentService {
    private final IStudentDAO studentRepo = new StudentDAO();
    @Override
    public List<Student> displayStudent() {
        return studentRepo.displayStudent();
    }

    @Override
    public List<Student> sortByName() {
        return studentRepo.sortByName();
    }

    @Override
    public List<Student> findStudentByName(String name) {
        return studentRepo.findStudentByName(name);
    }

    @Override
    public void deleteStudent(int id) {
        studentRepo.deleteStudent(id);
    }

    @Override
    public Student findStudentByID(int id) {
        return studentRepo.findStudentByID(id);
    }

    @Override
    public void addStudent(Student student) {
        studentRepo.addStudent(student);
    }

    @Override
    public void editStudent(Student student) {
        studentRepo.editStudent(student);
    }
}
