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
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void displayList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.displayList();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product-list.jsp");
        requestDispatcher.forward(request, response);
    }
}