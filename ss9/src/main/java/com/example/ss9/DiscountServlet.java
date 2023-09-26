package com.example.ss9;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/discount-servlet")
public class DiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price = Double.parseDouble(request.getParameter("prodPrice"));
        double discount = Double.parseDouble(request.getParameter("discountPercent"));
        double result = price * discount * 0.01;
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("result", result);
        requestDispatcher.forward(request,response);
    }
}