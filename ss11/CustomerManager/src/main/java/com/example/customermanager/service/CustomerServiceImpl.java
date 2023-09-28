package com.example.customermanager.service;

import com.example.customermanager.model.Customer;
import com.example.customermanager.repository.CustomerRepoImpl;
import com.example.customermanager.repository.ICustomerRepo;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    private final ICustomerRepo customerRepo = new CustomerRepoImpl();
    @Override
    public List<Customer> displayList() {
        return customerRepo.displayList();
    }

    @Override
    public void addCustomer(Customer customer) {
        customerRepo.addCustomer(customer);
    }

    @Override
    public Customer findById(int id) {
        return customerRepo.findById(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerRepo.updateCustomer(customer);
    }

    @Override
    public void removeCustomer(int id) {
        customerRepo.removeCustomer(id);
    }
}
