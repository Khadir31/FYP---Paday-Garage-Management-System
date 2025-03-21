/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.StaffDAO;
import com.model.staff;

@WebServlet("/staffServlet")  // Annotation to map this servlet to the URL /staffServlet
public class StaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDAO staffDAO;  // Instance variable for StaffDAO

    // Initialize method called when servlet is first created
    public void init() {
        staffDAO = new StaffDAO();  // Initialize StaffDAO instance
    }

    // Handle POST requests (form submissions)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the action parameter from the form to determine the action
        String action = request.getParameter("action");

        // Perform actions based on the action parameter
        if ("register".equals(action)) {
            register(request, response);  // Call register method if action is "register"
        } else if ("login".equals(action)) {
            login(request, response);  // Call login method if action is "login"
        } else if ("updateProfile".equals(action)) {
            updateProfile(request, response);  // Call updateProfile method if action is "updateProfile"
        } else {
            // Handle invalid action (if needed)
            response.sendRedirect("error.jsp");  // Redirect to an error page or handle accordingly
        }
    }

    // Method to handle staff registration
    private void register(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // Retrieve registration form parameters
        String staff_name = request.getParameter("staff_name");
        String staff_username = request.getParameter("staff_username");
        String password = request.getParameter("password");
        String phone_number = request.getParameter("phone_number");
        String staff_email = request.getParameter("staff_email");

        // Create a new staff object with the retrieved parameters
        staff newStaff = new staff(staff_name, staff_username, password, phone_number, staff_email);

        try {
            // Call DAO method to register the new staff member
            staffDAO.registerStaff(newStaff);
            // Redirect to the login page after successful registration
            response.sendRedirect("staffLogin.jsp");
        } catch (Exception e) {
            e.printStackTrace();  // Print stack trace if an exception occurs
            // Throw a ServletException if there's an error during registration
            throw new ServletException("Error registering staff", e);
        }
    }

    // Method to handle staff login
    private void login(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // Retrieve login form parameters
        String email = request.getParameter("staff_email");
        String password = request.getParameter("password");

        try {
            // Validate login credentials using the StaffLoginDAO
            staff staffMember = staffDAO.validateStaffLogin(email, password);

            if (staffMember != null) {
                // If login is successful, create a session and redirect to staff dashboard
                HttpSession session = request.getSession();
                session.setAttribute("staff", staffMember);
                response.sendRedirect("staffdb.jsp");
            } else {
                // If login fails, redirect back to login page with error
                response.sendRedirect("staffLogin.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();  // Print stack trace if an exception occurs
            // Throw a ServletException if there's an error during login
            throw new ServletException("Error logging in", e);
        }
    }

    // Method to handle updating staff profile
    private void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // Retrieve profile update form parameters
        String staff_idStr = request.getParameter("staff_id");
        int staff_id = 0;
        
        // Validate staff_id parameter
        try {
            if (staff_idStr != null && !staff_idStr.isEmpty()) {
                staff_id = Integer.parseInt(staff_idStr);
            } else {
                throw new ServletException("Missing staff_id parameter");
            }
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid staff_id parameter", e);
        }

        String staff_name = request.getParameter("staff_name");
        String staff_username = request.getParameter("staff_username");
        String password = request.getParameter("password");
        String phone_number = request.getParameter("phone_number");
        String staff_email = request.getParameter("staff_email");

        // Create a new staff object with the retrieved parameters
        staff updatedStaff = new staff(staff_id, staff_name, staff_username, password, phone_number, staff_email);

        try {
            // Call DAO method to update the staff member's profile
            staffDAO.updateStaff(updatedStaff);
            // Update the session with the new staff details
            HttpSession session = request.getSession();
            session.setAttribute("staff", updatedStaff);
            // Redirect to the staff dashboard after successful update
            response.sendRedirect("staffdb.jsp");
        } catch (Exception e) {
            e.printStackTrace();  // Print stack trace if an exception occurs
            // Throw a ServletException if there's an error during profile update
            throw new ServletException("Error updating profile", e);
        }
    }
}

