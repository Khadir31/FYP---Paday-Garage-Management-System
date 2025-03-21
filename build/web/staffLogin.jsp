<%-- 
    Document   : staffLogin
    Created on : 2 May 2024, 9:06:49 AM
    Author     : Acer
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Staff Login</title>
<link rel="stylesheet" href="css/staffreg.css">
</head>
<body>
    <div class="wrapper">
        <div class="left-side">
            <h2>Staff Login</h2>
            <form action="staffServlet?action=login" method="post">
                <div class="input-box">
                    <input type="email" id="staff_email" name="staff_email" required placeholder="Staff Email">
                </div>
                <div class="input-box">
                    <input type="password" id="password" name="password" required placeholder="Password">
                </div>
                <div class="input-box button">
                    <input type="submit" value="Login">
                </div>
            </form>

            <% if (request.getParameter("error") != null) { %>
                <p class="error-message">Invalid username or password</p>
            <% } %>

            <div class="text">
                <h3>Don't have an account? <a href="staff_register.jsp">Sign up now</a></h3>
            </div>
        </div>
        <div class="right-side">
            <img src="images/towing.png" alt="Image">
        </div>
    </div>
</body>
</html>
