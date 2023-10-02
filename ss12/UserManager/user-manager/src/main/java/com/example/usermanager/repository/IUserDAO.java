package com.example.usermanager.repository;

import com.example.usermanager.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> displayAllUsers();

    public void deleteUser(int id);

    public void updateUser(User user);
    List<User> findByCountry(String country) throws SQLException;
    List<User> orderByName();
    User findUserById(int id);
    void insertUserSP(User user) throws SQLException;
    void deleteUserSP(int id);
    void editUserSP(User user);
    List<User> displayUsersSP();
}
