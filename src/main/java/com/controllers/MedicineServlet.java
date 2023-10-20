package com.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Medicine;
import services.MedicineService;

import java.io.IOException;
import java.util.List;

public class MedicineServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MedicineService medicineService = new MedicineService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            List<Medicine> medicines = medicineService.getAllMedicines();
            request.setAttribute("medicines", medicines);
            request.getRequestDispatcher("MedicineListView.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            // Edit action: Show edit form for a specific medicine
            int medicineId = Integer.parseInt(request.getParameter("medicineId"));
            Medicine medicine = medicineService.getMedicineById(medicineId);
            request.setAttribute("medicine", medicine);
            request.getRequestDispatcher("MedicineEditView.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            // Delete action: Delete a specific medicine
            int medicineId = Integer.parseInt(request.getParameter("medicineId"));
            medicineService.deleteMedicine(medicineId);
            response.sendRedirect(request.getContextPath() + "/medicines");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            // Create action: Add a new medicine
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int availability = Integer.parseInt(request.getParameter("availability"));

            Medicine newMedicine = new Medicine();
            newMedicine.setAvailability(availability);
            newMedicine.setName(name);
            newMedicine.setPrice(price);
            medicineService.addMedicine(newMedicine);
            response.sendRedirect(request.getContextPath() + "/medicines");
        } else if (action.equals("update")) {
            // Update action: Update an existing medicine
            int medicineId = Integer.parseInt(request.getParameter("medicineId"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int availability = Integer.parseInt(request.getParameter("availability"));

            Medicine updatedMedicine = new Medicine(medicineId, name, price, availability);
            medicineService.updateMedicine(updatedMedicine);
            response.sendRedirect(request.getContextPath() + "/medicines");
        }
    }
}
