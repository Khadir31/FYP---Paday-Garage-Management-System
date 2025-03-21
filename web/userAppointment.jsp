<%-- 
    Document   : userAppointment
    Created on : 30 Jun 2024, 12:38:55 AM
    Author     : Acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.AppointmentsDAO" %>
<%@ page import="com.model.appointments" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Your Appointments</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { padding-top: 20px; }
        .container { max-width: 800px; }
    </style>
</head>
<body>
    <div class="container">
        <%
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("login.jsp"); // Redirect to login page if userId is not found
            }
        %>
        <h2 class="mb-4">Schedule an Appointment</h2>
        <form action="appointment" method="post">
            <input type="hidden" id="userId" name="userId" value="<%= userId %>">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="carModel" class="form-label">Car Model:</label>
                <input type="text" class="form-control" id="carModel" name="carModel" required>
            </div>
            <div class="mb-3">
                <label for="appointmentDate" class="form-label">Appointment Date:</label>
                <input type="date" class="form-control" id="appointmentDate" name="appointmentDate" required>
            </div>
            <div class="mb-3">
                <label for="appointmentTime" class="form-label">Appointment Time:</label>
                <input type="time" class="form-control" id="appointmentTime" name="appointmentTime" required>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
        <div class="mb-4">
            <a href="userhome.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
        <h2 class="mb-3">Your Appointments</h2>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Appointment ID</th>
                        <th>Name</th>
                        <th>Car Model</th>
                        <th>Appointment Date</th>
                        <th>Appointment Time</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        AppointmentsDAO appointmentsDAO = new AppointmentsDAO();
                        List<appointments> appointmentList = appointmentsDAO.selectAllAppointmentsByUserId(userId);
                        for (appointments appointment : appointmentList) {
                    %>
                    <tr>
                        <td><%= appointment.getAppointmentId() %></td>
                        <td><%= appointment.getName() %></td>
                        <td><%= appointment.getCarModel() %></td>
                        <td><%= appointment.getAppointmentDate() %></td>
                        <td><%= appointment.getAppointmentTime() %></td>
                        <td><%= appointment.getStatus() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS (optional, but needed for some Bootstrap features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
