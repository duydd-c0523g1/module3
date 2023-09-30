package com.example.studentmanager.repository;

import com.example.studentmanager.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO implements IStudentDAO {
    public StudentDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String JDBC_URL = "jdbc:mysql://localhost:3306/?user=root";
            String JDBC_USERNAME = "root";
            String JDBC_PASSWORD = "Duylatao12345";
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public List<Student> displayStudent() {
        List<Student> studentList = new ArrayList<>();
        String SQL_SELECT = "SELECT * FROM student.students;";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_SELECT)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("sid");
                String name = resultSet.getString("sname");
                String dob = resultSet.getString("sdob");
                String classID = resultSet.getString("sclass");
                String email = resultSet.getString("semail");
                String phone = resultSet.getString("sphone");
                studentList.add(new Student(id, name, dob, classID, email, phone));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return studentList;
    }

    @Override
    public List<Student> sortByName() {
        List<Student> studentList = new ArrayList<>();
        String SQL_ORDER_BY_NAME = "SELECT * FROM student.students ORDER BY sname";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_ORDER_BY_NAME)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("sname");
                String dob = resultSet.getString("sdob");
                String classID = resultSet.getString("sclass");
                String email = resultSet.getString("semail");
                String phone = resultSet.getString("sphone");
                studentList.add(new Student(name, dob, classID, email, phone));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return studentList;
    }

    @Override
    public List<Student> findStudentByName(String name) {
        List<Student> studentList = new ArrayList<>();
        String SQL_FIND_BY_NAME = "SELECT * FROM student.students WHERE sname = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_FIND_BY_NAME)) {
            preparedStatement.setString(1, name);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                name = resultSet.getString("sname");
                String dob = resultSet.getString("sdob");
                String classID = resultSet.getString("sclass");
                String email = resultSet.getString("semail");
                String phone = resultSet.getString("sphone");
                studentList.add(new Student(name, dob, classID, email, phone));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return studentList;
    }

    @Override
    public void deleteStudent(int id) {
        String SQL_DELETE_STUDENT = "DELETE FROM student.students WHERE sid = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_DELETE_STUDENT)) {
            preparedStatement.setString(1, String.valueOf(id));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Student findStudentByID(int id) {
        String SQL_FIND_BY_ID = "SELECT * FROM student.students WHERE sid = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_FIND_BY_ID)) {
            preparedStatement.setString(1, String.valueOf(id));
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("sname");
                String dob = resultSet.getString("sdob");
                String classID = resultSet.getString("sclass");
                String email = resultSet.getString("semail");
                String phone = resultSet.getString("sphone");
                return new Student(id, name, dob, classID, email, phone);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void addStudent(Student student) {
        String SQL_ADD_STUDENT = "INSERT INTO student.students(sname, sdob, sclass, semail, sphone) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_ADD_STUDENT)) {
            preparedStatement.setString(1,student.getName());
            preparedStatement.setString(2,student.getDob());
            preparedStatement.setString(3,student.getClassId());
            preparedStatement.setString(4,student.getEmail());
            preparedStatement.setString(5,student.getPhone());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void editStudent(Student student) {
        String SQL_EDIT_STUDENT = "UPDATE student.students SET sname = ?, sdob = ?, sclass = ?, semail = ?, sphone = ? WHERE sid = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_EDIT_STUDENT)) {
            preparedStatement.setInt(6, student.getId());
            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getDob());
            preparedStatement.setString(3, student.getClassId());
            preparedStatement.setString(4, student.getEmail());
            preparedStatement.setString(5, student.getPhone());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
