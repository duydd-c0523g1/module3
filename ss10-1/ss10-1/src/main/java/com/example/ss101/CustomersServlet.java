package com.example.ss101;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomersServlet", value = "")
public class CustomersServlet extends HttpServlet {
    private static List<Customer> customersList;

    static {
        customersList = new ArrayList<>();
        customersList.add(new Customer("Elon Musk", "28/06/1971", "Mars", "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Elon_Musk_Colorado_2022_%28cropped2%29.jpg/800px-Elon_Musk_Colorado_2022_%28cropped2%29.jpg"));
        customersList.add(new Customer("Mark Zuckerberg", "14/05/1984", "Meta", "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Mark_Zuckerberg_F8_2019_Keynote_%2832830578717%29_%28cropped%29.jpg/800px-Mark_Zuckerberg_F8_2019_Keynote_%2832830578717%29_%28cropped%29.jpg"));
        customersList.add(new Customer("La Lisa", "27/05/1997", "Thai", "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/BLACKPINK%27s_Lisa_for_BULGARI_June_2023_01_%28cropped%29.jpg/800px-BLACKPINK%27s_Lisa_for_BULGARI_June_2023_01_%28cropped%29.jpg"));
        customersList.add(new Customer("Jeff Bezos", "12/01/1964", "Amazon", "https://upload.wikimedia.org/wikipedia/commons/0/03/Jeff_Bezos_visits_LAAFB_SMC_%283908618%29_%28cropped%29.jpeg"));
        customersList.add(new Customer("Dao Duc Duy", "13/06/1998", "Da Nang", "https://upload.wikimedia.org/wikipedia/commons/e/e9/Ph%E1%BA%A1m_Nh%E1%BA%ADt_V%C6%B0%E1%BB%A3ng.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customersList", customersList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}