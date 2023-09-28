package com.example.productmanager.controller;

import com.example.productmanager.model.Product;
import com.example.productmanager.service.IProductService;
import com.example.productmanager.service.ProductSeriveImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product-controller")
public class ProductController extends HttpServlet {
    private final IProductService productService = new ProductSeriveImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch(action) {
            case "list":
                displayList(request, response);
                break;
            case "fill":
                fillForm(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addProduct(request, response);
                break;
            case "findId":
                findById(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
        }
    }
    private void displayList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.displayList();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product-list.jsp");
        requestDispatcher.forward(request, response);
    }
    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        Product product = new Product(name, price, description, manufacturer);
        productService.addProduct(product);
        List<Product> productList = productService.displayList();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product-list.jsp");
        requestDispatcher.forward(request, response);
    }
    private void fillForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = productService.findById(Integer.parseInt(request.getParameter("productId")));
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit-product.jsp");
        requestDispatcher.forward(request, response);
    }
    private void findById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = productService.findById(Integer.parseInt(request.getParameter("idToFind")));
        String notFound = "No product found!";
        if (product != null) {
            request.setAttribute("result", product);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/find-id.jsp");
            requestDispatcher.forward(request, response);
        } else {
            List<Product> productList = productService.displayList();
            request.setAttribute("productList", productList);
            request.setAttribute("result", notFound);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product-list.jsp");
            requestDispatcher.forward(request, response);
        }
    }
    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        Product product = new Product(id, name, price, manufacturer, description);
        productService.editProduct(product);
        List<Product> productList = productService.displayList();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product-list.jsp");
        requestDispatcher.forward(request, response);
    }
}