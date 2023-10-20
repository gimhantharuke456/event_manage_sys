package com.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import models.Medicine;
import services.MedicineService;


public class MedicineCatalogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MedicineService medicineService = new MedicineService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        List<Medicine> medicines = medicineService.getAllMedicines();
        request.setAttribute("medicines", medicines);
        try {
			request.getRequestDispatcher("MedicineCatalog.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
}
