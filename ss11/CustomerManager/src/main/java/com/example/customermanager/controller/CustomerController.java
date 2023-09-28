package com.example.customermanager.controller;

import com.example.customermanager.model.Customer;
import com.example.customermanager.service.CustomerServiceImpl;
import com.example.customermanager.service.ICustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerController", value = "")
public class CustomerController extends HttpServlet {
    private final ICustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                fillEditForm(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    protected void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerService.displayList();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display_customer.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request, response);
    }
    protected void fillEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerId = request.getParameter("customerId");
        Customer customer = customerService.findById(Integer.parseInt(customerId));
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/update_customer.jsp").forward(request, response);
    }

    protected void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        customerService.removeCustomer(Integer.parseInt(request.getParameter("customerId")));
        List<Customer> customerList = customerService.displayList();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display_customer.jsp");
        request.setAttribute("customerList", customerList);
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
                addCustomer(request, response);
                break;
            case "find-by-id":
                findById(request, response);
                break;
            case "update-customer":
                updateCustomer(request, response);
        }
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(name, email, address);
        customerService.addCustomer(customer);
        showList(request, response);
    }

    private void findById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer result = customerService.findById(Integer.parseInt(request.getParameter("id")));
        String notFound = "No customer found!";
        if (result != null) {
            request.setAttribute("result", result);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/find_by_id.jsp");
            requestDispatcher.forward(request, response);

        } else {
            List<Customer> customerList = customerService.displayList();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display_customer.jsp");
            request.setAttribute("customerList", customerList);
            request.setAttribute("result", notFound);
            requestDispatcher.forward(request, response);
        }
    }
    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, name, email, address);
        customerService.updateCustomer(customer);
        List<Customer> customerList = customerService.displayList();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display_customer.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request, response);
    }
}