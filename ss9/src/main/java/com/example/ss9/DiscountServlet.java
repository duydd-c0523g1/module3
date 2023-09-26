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
        double priceAfter = price - result;
        String prodName = request.getParameter("prodDesc");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display.jsp");
        request.setAttribute("name", prodName);
        request.setAttribute("result", result);
        request.setAttribute("priceAfter", priceAfter);
        requestDispatcher.forward(request,response);
    }
}