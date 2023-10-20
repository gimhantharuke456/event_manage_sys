package com.controllers;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.OrderDao;
import models.Order;

public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDao orderDao;

    public OrderServlet() {
        super();
        this.orderDao = new OrderDao(); 
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteOrder(request, response);
                    break;
                default:
                    break;
            }
        } else {
            listOrders(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "create":
                    createOrder(request, response);
                    break;
                case "edit":
                    updateOrder(request, response);
                    break;
                default:
                    break;
            }
        } else {
            listOrders(request, response);
        }
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Order> orders = orderDao.getAllOrders();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("Orders.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        Order existingOrder = orderDao.getOrderById(orderId);
        request.setAttribute("order", existingOrder);
        request.getRequestDispatcher("EditOrder.jsp").forward(request, response);
    }

    private void createOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderedBy = request.getParameter("orderedBy");
        String address = request.getParameter("address");

        Order newOrder = new Order();
        newOrder.setOrderedBy(orderedBy);
        newOrder.setOrderedAt(new Timestamp(System.currentTimeMillis()));
        newOrder.setAddress(address);
        newOrder.setItemName(request.getParameter("item_name"));
        orderDao.createOrder(newOrder);
        response.sendRedirect(request.getContextPath() + "/orders");
    }

    private void updateOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String orderedBy = request.getParameter("orderedBy");
        String address = request.getParameter("address");

        Order updatedOrder = new Order();
        updatedOrder.setId(orderId);
        updatedOrder.setOrderedBy(orderedBy);
        updatedOrder.setOrderedAt(new Timestamp(System.currentTimeMillis()));
        updatedOrder.setAddress(address);

        orderDao.updateOrder(updatedOrder);
        response.sendRedirect(request.getContextPath() + "/orders");
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        orderDao.deleteOrder(orderId);
        response.sendRedirect(request.getContextPath() + "/orders");
    }
}
