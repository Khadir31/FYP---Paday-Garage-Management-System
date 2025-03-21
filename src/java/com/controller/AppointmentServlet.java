/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.AppointmentsDAO;
import com.model.appointments;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"/appointment", "/appointmentAction"})  // Map servlet to both URLs
public class AppointmentServlet extends HttpServlet {
    private AppointmentsDAO appointmentsDAO = new AppointmentsDAO();

    // Handle POST requests (form submissions for creating an appointment)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check the request URL to determine the action
        String path = request.getServletPath();
        if ("/appointment".equals(path)) {
            createAppointment(request, response);
        } else if ("/appointmentAction".equals(path)) {
            handleAppointmentAction(request, response);
        }
    }

    // Method to handle creating an appointment
    private void createAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form parameters for the appointment
            int userId = Integer.parseInt(request.getParameter("userId"));
            String name = request.getParameter("name");
            String carModel = request.getParameter("carModel");
            String appointmentDate = request.getParameter("appointmentDate");
            String appointmentTime = request.getParameter("appointmentTime");

            // Create and set up a new appointments object
            appointments appointment = new appointments();
            appointment.setUserId(userId);
            appointment.setName(name);
            appointment.setCarModel(carModel);
            appointment.setAppointmentDate(appointmentDate);
            appointment.setAppointmentTime(appointmentTime);
            appointment.setStatus("Pending");

            // Insert the new appointment into the database
            appointmentsDAO.insertAppointment(appointment);

            // Redirect to the user's appointment page after successful creation
            response.sendRedirect("userAppointment.jsp");
        } catch (Exception e) {
            // Handle any exceptions by throwing a ServletException with an error message
            throw new ServletException("Error creating appointment", e);
        }
    }

    // Method to handle actions on appointments (approve/reject)
    private void handleAppointmentAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve action and appointmentId from the form
        String action = request.getParameter("action");
        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

        // Ensure the action is not null and handle single click restriction
        if (action != null && !action.isEmpty()) {
            HttpSession session = request.getSession();
            String currentAction = (String) session.getAttribute("currentAction_" + appointmentId);
            
            // Check if this action is not a double click
            if (currentAction == null || currentAction.isEmpty()) {
                // Perform the appropriate action based on the value of action parameter
                if (action.equals("approve")) {
                    appointmentsDAO.updateAppointmentStatus(appointmentId, "Approved");
                } else if (action.equals("reject")) {
                    appointmentsDAO.updateAppointmentStatus(appointmentId, "Rejected");
                }

                // Set the current action in session to prevent double click
                session.setAttribute("currentAction_" + appointmentId, action);
            }
        }

        // Redirect back to the appointments page
        response.sendRedirect("adminAppointment.jsp");
    }
}

