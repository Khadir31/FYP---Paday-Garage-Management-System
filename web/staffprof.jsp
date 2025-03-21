<%-- 
    Document   : staffprof
    Created on : 12 Jun 2024, 6:22:08 PM
    Author     : Acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.staff" %>
<%@ page session="true" %>
<%
    HttpSession currentSession = request.getSession(false);
    staff staffMember = (staff) currentSession.getAttribute("staff");

    if (staffMember == null) {
        response.sendRedirect("staffLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 500px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
        }
        .form-group {
            margin: 15px 0;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn {
            display: inline-block;
            width: 100%;
            padding: 10px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-back {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background-color: #6c757d;
            border: none;
            border-radius: 4px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            margin-top: 20px;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Profile</h1>
        <form action="staffServlet?action=updateProfile" method="post">
            <input type="hidden" name="staff_id" value="<%= staffMember.getStaff_id() %>">
            <div class="form-group">
                <label for="staff_name">Name:</label>
                <input type="text" id="staff_name" name="staff_name" value="<%= staffMember.getStaff_name() %>" required>
            </div>
            <div class="form-group">
                <label for="staff_username">Username:</label>
                <input type="text" id="staff_username" name="staff_username" value="<%= staffMember.getStaff_username() %>" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="<%= staffMember.getPassword() %>" required>
            </div>
            <div class="form-group">
                <label for="phone_number">Phone Number:</label>
                <input type="text" id="phone_number" name="phone_number" value="<%= staffMember.getPhone_number() %>" required>
            </div>
            <div class="form-group">
                <label for="staff_email">Email:</label>
                <input type="email" id="staff_email" name="staff_email" value="<%= staffMember.getStaff_email() %>" required>
            </div>
            <button type="submit" class="btn">Update Profile</button>
        </form>
        <a href="staffdb.jsp" class="btn-back">Back to Homepage</a>
    </div>
</body>
</html>


