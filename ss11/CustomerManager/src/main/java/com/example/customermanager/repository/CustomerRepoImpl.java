package com.example.customermanager.repository;

import com.example.customermanager.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepoImpl implements ICustomerRepo {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer(1, "Elon Musk", "elonmusk@tesla.mars", "Mars"));
        customerList.add(new Customer(2, "Jeff Bezos", "entrepreneur@amz.jungle", "Amazon"));
        customerList.add(new Customer(3, "Mark Zuckerberg", "zuck@meta.verse", "Meta"));
    }
    @Override
    public List<Customer> displayList() {
        return customerList;
    }

    @Override
    public void addCustomer(Customer customer) {
        customer.setId(customerList.get(customerList.size() - 1).getId() + 1);
        customerList.add(customer);
    }

    @Override
    public Customer findById(int id) {
        for (Customer c : customerList) {
            if (c.getId() == id) {
                return c;
            }
        }
        return null;
    }

    @Override
    public void updateCustomer(Customer customer) {
        for (Customer cus: customerList) {
            if (cus.getId() == customer.getId()) {
                customerList.set(customerList.indexOf(cus), customer);
//                cus.setName(customer.getName());
//                cus.setEmail(customer.getEmail());
//                cus.setAddress(customer.getAddress());
            }
        }
    }

    @Override
    public void removeCustomer(int id) {
        for (int i = 0; i < customerList.size(); i++) {
            if (customerList.get(i).getId() == id) {
                customerList.remove(customerList.get(i));
            }
        }
    }
}
