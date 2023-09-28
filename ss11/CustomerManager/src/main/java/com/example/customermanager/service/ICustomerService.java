package com.example.customermanager.service;

import com.example.customermanager.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> displayList();
    void addCustomer(Customer customer);
    Customer findById(int id);
    void updateCustomer(Customer customer);
    void removeCustomer(int id);
}
