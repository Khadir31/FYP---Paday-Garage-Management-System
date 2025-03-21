/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.UserDAO;
import com.model.users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

// Annotation to map this servlet to the URL /userServlet
@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    private static final Logger LOGGER = Logger.getLogger(UserServlet.class.getName());

    // Initialize the UserDAO object
    public void init() {
        userDAO = new UserDAO();
    }

    // Handle GET requests (e.g., for displaying forms/pages)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        LOGGER.info("GET request received with action: " + action);

        try {
            if ("updateProfile".equals(action)) {
                showUpdateForm(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "The requested resource is not available.");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error handling GET request", e);
            throw new ServletException(e);
        }
    }

    // Handle POST requests (e.g., form submissions)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        LOGGER.info("POST request received with action: " + action);

        try {
            if ("register".equals(action)) {
                register(request, response);
            } else if ("login".equals(action)) {
                login(request, response);
            } else if ("updateProfile".equals(action)) {
                updateProfile(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error handling POST request", e);
            throw new ServletException(e);
        }
    }

    // Method to show the update profile form
    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateProfile.jsp");
        dispatcher.forward(request, response);
    }

    // Method to handle user registration
   private void register(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");

    users newUser = new users(username, password, email, phoneNumber);
    try {
        userDAO.registerUser(newUser);
        String redirectUrl = "userLogin.jsp?message=" + URLEncoder.encode("Registration successful!", "UTF-8");
        response.sendRedirect(redirectUrl);
    } catch (SQLException | ClassNotFoundException e) {
        LOGGER.log(Level.SEVERE, "Error registering user", e);
        throw new ServletException("Error registering user", e);
    }
}




    // Method to handle user login
private void login(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
    // Retrieve email and password from the login form
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
        // Check login credentials using the UserDAO
        users user = userDAO.checkLogin(email, password);
        String destPage = "userLogin.jsp";  // Default destination page if login fails

        if (user != null) {
            // If login is successful, create a session and set user attributes
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            destPage = "userhome.jsp";  // Redirect to user home page after successful login

            // Assuming successful login logic, set userId in the session
            int userId = user.getId();  // Get user ID from the user object
            session.setAttribute("userId", userId);
        } else {
            // If login fails, set an error message
            String message = "Invalid email/password";
            request.setAttribute("message", message);
        }

        // Forward the request to the appropriate destination page
        request.getRequestDispatcher(destPage).forward(request, response);

    } catch (SQLException | ClassNotFoundException e) {
        // Log the error and throw a ServletException if there's an issue during login
        LOGGER.log(Level.SEVERE, "Error logging in", e);
        throw new ServletException("Error logging in", e);
    }
}

    // Method to handle profile update
    private void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        users user = new users(id, username, email, phoneNumber, password);

        try {
            userDAO.updateUser(user);
            response.sendRedirect("userhome.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "Error updating profile", e);
            throw new ServletException("Error updating profile", e);
        }
    }
}