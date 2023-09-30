package com.example.studentmanager.controller;

import com.example.studentmanager.model.Student;
import com.example.studentmanager.repository.IStudentDAO;
import com.example.studentmanager.repository.StudentDAO;
import com.example.studentmanager.service.IStudentService;
import com.example.studentmanager.service.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "")
public class StudentServlet extends HttpServlet {
    private final IStudentService studentService = new StudentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "sort-name":
                sortByName(request, response);
                break;
            case "edit":
                fillEditForm(request, response);
                break;
            case "delete":
                deleteStudent(request, response);
            default:
                displayStudentList(request, response);
                break;
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        studentService.deleteStudent(Integer.parseInt(request.getParameter("id")));
        List<Student> studentList = studentService.displayStudent();
        request.setAttribute("studentList", studentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("student/list.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addStudent(request, response);
                break;
            case "save":
                saveEditForm(request, response);
            default:
                break;
        }
    }

    private void displayStudentList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> studentList = studentService.displayStudent();
        request.setAttribute("studentList", studentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("student/list.jsp");
        requestDispatcher.forward(request, response);
    }
    private void addStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String classID = request.getParameter("class");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Student student = new Student(name, dob, classID, email, phone);
        studentService.addStudent(student);
        List<Student> studentList = studentService.displayStudent();
        request.setAttribute("studentList", studentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("student/list.jsp");
        requestDispatcher.forward(request, response);
    }
    private void fillEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentService.findStudentByID(id);
        request.setAttribute("student", student);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("student/edit.jsp");
        requestDispatcher.forward(request, response);
    }
    private void saveEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String classId = request.getParameter("class");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        studentService.editStudent(new Student(id, name, dob, classId, email, phone));
        List<Student> studentList = studentService.displayStudent();
        request.setAttribute("studentList", studentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("student/list.jsp");
        requestDispatcher.forward(request, response);
    }
    private void sortByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> studentList = studentService.sortByName();
        request.setAttribute("studentList", studentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("student/list.jsp");
        requestDispatcher.forward(request, response);
    }

}