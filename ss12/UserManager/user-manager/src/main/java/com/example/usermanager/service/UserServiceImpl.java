package com.example.usermanager.service;

import com.example.usermanager.model.User;
import com.example.usermanager.repository.IUserDAO;
import com.example.usermanager.repository.UserDAO;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService {
    private final IUserDAO userDAO = new UserDAO();
    @Override
    public void insertUser(User user) throws SQLException {
        userDAO.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDAO.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userDAO.selectAllUsers();
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        userDAO.deleteUser(id);
    }

    @Override
    public void updateUser(User user) throws SQLException {
        userDAO.updateUser(user);
    }

    @Override
    public List<User> findByCountry(String country) throws SQLException {
        return userDAO.findByCountry(country);
    }

    @Override
    public List<User> orderByName() {
        return userDAO.orderByName();
    }
}
