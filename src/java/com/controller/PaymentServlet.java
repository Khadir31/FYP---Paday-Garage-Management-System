/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.PaymentDAO;
import com.model.Payment;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/paymentServlet")
@MultipartConfig(maxFileSize = 16177215) // file size up to 16MB
public class PaymentServlet extends HttpServlet {
    private PaymentDAO paymentDAO = new PaymentDAO();
    private static final long serialVersionUID = 1L;

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("getPayment".equals(action)) {
            handleGetPayments(request, response);
        } else if ("updateStatus".equals(action)) {
            handleUpdateStatus(request, response);
        } else {
            response.sendRedirect("managePayments.jsp");
        }
    }
    

    private void handleGetPayments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PaymentDAO paymentDAO = new PaymentDAO();
            List<Payment> payments = paymentDAO.getAllPayments();
            request.setAttribute("payments", payments);
            request.setAttribute("luqman", "messages");

            request.getRequestDispatcher("managePayments.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    private void handleUpdateStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int paymentId = Integer.parseInt(request.getParameter("paymentId"));
        String status = request.getParameter("status");

        try {
            PaymentDAO paymentDAO = new PaymentDAO();
            paymentDAO.updatePaymentStatus(paymentId, status);
            response.sendRedirect("paymentServlet?action=view");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
    //Add new product
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("updateStatus".equalsIgnoreCase(action)) {
            handleUpdateStatus(request, response);
        } else {
            int userId = Integer.parseInt(request.getParameter("userId"));
            BigDecimal totalPrice = new BigDecimal(request.getParameter("totalPrice"));
            Part filePart = request.getPart("image");
            InputStream inputStream = null;

            if (filePart != null) {
                inputStream = filePart.getInputStream();
            }

            Payment payment = new Payment();
            payment.setUserId(userId);
            payment.setTotalPrice(totalPrice);
            payment.setImage(inputStream);
            payment.setStatus("Pending");

            try {
                PaymentDAO paymentDAO = new PaymentDAO();
                paymentDAO.insertPayment(payment);
                response.getWriter().write("Payment successfully recorded!");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                response.getWriter().write("Error: " + e.getMessage());
            }
        }
    }
    // Method to handle actions on payments (approve/reject)
    private void handlePaymentAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        // Retrieve action and paymentId from the form
        String status = request.getParameter("status");
        int paymentId = Integer.parseInt(request.getParameter("paymentId"));

        // Ensure the action is not null and handle single click restriction
        if (status != null && !status.isEmpty()) {
            HttpSession session = request.getSession();
            String currentStatus = (String) session.getAttribute("currentAction_" + paymentId);

            // Check if this action is not a double click
            if (currentStatus == null || currentStatus.isEmpty()) {
                // Perform the appropriate action based on the value of action parameter
                if (status.equals("Approved")) {
                    paymentDAO.updatePaymentStatus(paymentId, "Approved");
                } else if (status.equals("Rejected")) {
                    paymentDAO.updatePaymentStatus(paymentId, "Rejected");
                }

                // Set the current action in session to prevent double click
                session.setAttribute("currentAction_" + paymentId, status);
            }
        }

        // Redirect back to the payments page
        response.sendRedirect("managePayments.jsp");
    }
}
