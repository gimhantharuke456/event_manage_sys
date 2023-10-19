package com.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.UserModel;
import services.UserService;

public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	Cookie[] cookies = request.getCookies();
    	String userEmail = null;

    	if (cookies != null) {
    	    for (Cookie cookie : cookies) {
    	        if ("email".equals(cookie.getName())) {
    	            userEmail = cookie.getValue();
    	            break;
    	        }
    	    }
    	}
        UserModel user = userService.getUserByEmail(userEmail);
        request.setAttribute("user", user);
        request.getRequestDispatcher("UserView.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String email ="thamodathathsarani98@gmail.com";
        UserModel user = userService.getUserByEmail(email);

        if (action.equals("edit")) {
        
            user.setName(request.getParameter("name"));
            user.setPassword(request.getParameter("password"));
            userService.updateUser(user);
        } else if (action.equals("delete")) {
        
            userService.deleteUser(email);
           
            response.sendRedirect("LoginView.jsp");
            return;
        }

        // Redirect to the user profile page after editing
        response.sendRedirect(request.getContextPath() + "/profile");
    }
}
