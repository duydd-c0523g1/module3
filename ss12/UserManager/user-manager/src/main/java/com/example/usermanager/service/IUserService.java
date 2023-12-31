package com.example.usermanager.service;

import com.example.usermanager.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    void deleteUser(int id) throws SQLException;

    void updateUser(User user) throws SQLException;

    List<User> findByCountry(String country) throws SQLException;
    List<User> orderByName();
    User findUserById(int id);
    void insertUserSP(User user) throws SQLException;
    void deleteUserSP(int id);
    void editUserSP(User user);
    List<User> displayUsersSP();
}
