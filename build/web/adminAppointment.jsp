<%-- 
    Document   : adminAppointment
    Created on : 13 Jun 2024, 1:58:26 AM
    Author     : Acer
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.appointments" %>
<%@ page import="com.dao.AppointmentsDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Appointments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .approve-btn, .reject-btn {
            padding: 8px 12px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            color: #fff;
        }
        .approve-btn {
            background-color: #4CAF50;
        }
        .reject-btn {
            background-color: #f44336;
        }
        .btn-disabled {
            background-color: grey !important;
            cursor: default;
        }
        .btn-secondary {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }

    .btn-secondary:hover {
        color: #fff;
        background-color: #5a6268;
        border-color: #545b62;
    }

    .btn-secondary:focus, .btn-secondary.focus {
        outline: 0;
        box-shadow: 0 0 0 0.2rem rgba(130, 138, 145, 0.5);
    }

    .btn-secondary:disabled, .btn-secondary.disabled {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .btn-secondary {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        .btn-secondary {
            background-color: #008000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Staff Appointments</h2>
        <table>
            <thead>
                <tr>
                    <th>Appointment ID</th>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Car Model</th>
                    <th>Appointment Date</th>
                    <th>Appointment Time</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
    AppointmentsDAO appointmentsDAO = new AppointmentsDAO();
    List<appointments> appointmentList = appointmentsDAO.selectAllAppointments();
    for (appointments appointment : appointmentList) {
%>
                <tr>
                    <td><%= appointment.getAppointmentId() %></td>
                    <td><%= appointment.getUserId() %></td>
                    <td><%= appointment.getName() %></td>
                    <td><%= appointment.getCarModel() %></td>
                    <td><%= appointment.getAppointmentDate() %></td>
                    <td><%= appointment.getAppointmentTime() %></td>
                    <td><%= appointment.getStatus() %></td>
                    <td>
                        <% if (!"Approved".equals(appointment.getStatus()) && !"Rejected".equals(appointment.getStatus())) { %>
                            <form action="appointmentAction" method="post">
                                <input type="hidden" name="appointmentId" value="<%= appointment.getAppointmentId() %>">
                                <button type="submit" name="action" value="approve" class="approve-btn">Approve</button>
                                <button type="submit" name="action" value="reject" class="reject-btn">Reject</button>
                            </form>
                        <% } else { %>
                            <button class="btn-disabled">Processed</button>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
            <div class="mb-4">
            <a href="staffdb.jsp" class="btn-secondary">Back to Home</a>
        </div>
    </div>
  
    
</body>
</html>

