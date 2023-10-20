package com.controllers;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Order;


public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the form
        int medicineId = Integer.parseInt(request.getParameter("medicineId"));
        String medicineName = request.getParameter("medicineName");
        double medicinePrice = Double.parseDouble(request.getParameter("medicinePrice"));
        String address = request.getParameter("address");

       
        

       
        Order order = new Order();
        order.setItemName(medicineName);

        
        order.setOrderedAt(new Timestamp(new Date().getTime()));

       
        request.getSession().setAttribute("order", order);

        // Redirect to a confirmation page or any other page as needed
        response.sendRedirect(request.getContextPath() + "/orderConfirmation.jsp");
    }
}
