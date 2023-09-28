package com.example.customermanager.repository;

import com.example.customermanager.model.Customer;

import java.util.List;

public interface ICustomerRepo {
    List<Customer> displayList();
    void addCustomer(Customer customer);
    Customer findById(int id);
    void updateCustomer(Customer customer);
    void removeCustomer(int id);
}
