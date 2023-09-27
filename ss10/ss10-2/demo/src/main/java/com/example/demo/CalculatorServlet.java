package com.example.demo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/calculator.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double num1 = Integer.parseInt(request.getParameter("firstOp"));
        double num2 = Integer.parseInt(request.getParameter("secondOp"));
        String operator = request.getParameter("operator");
        double result = 0;
        String exception = null;
        try {
            switch (operator) {
                case "Addition":
                    result = num1 + num2;
                    break;
                case "Subtraction":
                    result = num1 - num2;
                    break;
                case "Multiplication":
                    result = num1 * num2;
                    break;
                case "Division":
                    result = num1 / num2;
                    break;
            }
        } catch (ArithmeticException e) {
            exception = "Cannot divide by zero";
        }
        if (exception == null) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/calculator.jsp");
            request.setAttribute("result", result);
            requestDispatcher.forward(request,response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/calculator.jsp");
            request.setAttribute("result", exception);
            requestDispatcher.forward(request,response);
        }
    }
}