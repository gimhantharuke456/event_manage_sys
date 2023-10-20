package com.controllers;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import models.Supplier;
import services.SupplierService;

//SupplierServlet.java

public class SupplierServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;
private SupplierService supplierService;

 public void init() {
     this.supplierService = new SupplierService();
 }

 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws  IOException {
     String action = request.getParameter("action");

     if (action == null) {
         List<Supplier> suppliers = supplierService.getAllSuppliers();
         request.setAttribute("suppliers", suppliers);
         RequestDispatcher dispatcher = request.getRequestDispatcher("supplierss.jsp");
         try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     } else if (action.equals("edit")) {
         String email = request.getParameter("email");
         Supplier supplier = supplierService.getSupplierByEmail(email);
         request.setAttribute("supplier", supplier);
         RequestDispatcher dispatcher = request.getRequestDispatcher("editSupplier.jsp");
         try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     } else if (action.equals("delete")) {
         String email = request.getParameter("email");
         supplierService.deleteSupplier(email);
         response.sendRedirect("suppliers");
     }
 }

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws IOException {
     String action = request.getParameter("action");

     if (action.equals("create")) {
         String email = request.getParameter("email");
         String name = request.getParameter("name");
         String address = request.getParameter("address");
         String contactNumber = request.getParameter("contactNumber");

         Supplier newSupplier = new Supplier(email, name, address, contactNumber);
         supplierService.addSupplier(newSupplier);
         response.sendRedirect("suppliers");
     } else if (action.equals("update")) {
         String email = request.getParameter("email");
         String name = request.getParameter("name");
         String address = request.getParameter("address");
         String contactNumber = request.getParameter("contactNumber");

         Supplier updatedSupplier = new Supplier(email, name, address, contactNumber);
         supplierService.updateSupplier(updatedSupplier);
         response.sendRedirect("suppliers");
     }
 }
}
