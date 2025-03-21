/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.dao.OrderDAO;
import com.model.Order;
import com.utils.ConnectionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/createOrderServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class CreateOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the form
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        
        // Get the file part
        Part filePart = request.getPart("image");
        byte[] imageBytes = null;
        if (filePart != null) {
            imageBytes = filePart.getInputStream().readAllBytes();
        }
        
        // Create Order object
        Order order = new Order();
        order.setUserId(1); // Assuming user ID 1 for simplicity. In a real app, get this from the session.
        order.setImage(imageBytes);
        order.setStatus("Pending"); // Set initial status
        order.setTotalPrice(totalPrice);
        
        // Save order to database
        try (Connection connection = ConnectionUtils.getConnection()) {
            OrderDAO orderDAO = new OrderDAO(connection);
            orderDAO.createOrder(order);
            request.setAttribute("orderId", order.getOrderId());
request.setAttribute("totalPrice", order.getTotalPrice());
request.setAttribute("status", order.getStatus());
request.getRequestDispatcher("orderConfirmation.jsp").forward(request, response); // Redirect to a confirmation page
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database error", e);
        }
    }
    // Inside the try block of CreateOrderServlet, after creating the order

// Replace the response.sendRedirect() with the above line
}