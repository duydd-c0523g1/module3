package com.example.usermanager.controller;

import com.example.usermanager.model.User;
import com.example.usermanager.repository.IUserDAO;
import com.example.usermanager.repository.UserDAO;
import com.example.usermanager.service.IUserService;
import com.example.usermanager.service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "")
public class UserServlet extends HttpServlet {
    private final IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "order-name":
                orderByName(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        requestDispatcher.forward(request, response);
    }
    private void orderByName (HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        List<User> userList = userService.orderByName();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            userService.deleteUser(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        User user = userService.selectUser(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("user", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/edit.jsp");
        requestDispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertUserSP(request, response);
                break;
            case "edit":
                updateUser(request, response);
                break;
            case "find-country":
                findByCountry(request, response);
                break;
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        try {
            userService.insertUser(new User(name, email, country));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        try {
            userService.updateUser(new User(id, name, email, country));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<User> userList = userService.selectAllUsers();
            request.setAttribute("userList", userList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
            requestDispatcher.forward(request, response);
    }
    private void findByCountry(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        try {
            List<User> userList = userService.findByCountry(request.getParameter("country"));
            request.setAttribute("result", userList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/fbc-results.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    private void insertUserSP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        try {
            userService.insertUserSP(new User(name, email, country));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        requestDispatcher.forward(request, response);
    }
    private void findUserById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = userService.findUserById(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("userList", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        requestDispatcher.forward(request, response);
    }
    private void displayUserSP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.displayUsersSP();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        requestDispatcher.forward(request, response);
    }
    private void deleteUserSP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        userService.deleteUserSP(Integer.parseInt(request.getParameter("id")));
        List<User> userList = userService.displayUsersSP();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        requestDispatcher.forward(request, response);
    }
}