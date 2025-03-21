<%-- 
    Document   : staff_register
    Created on : 1 May 2024, 11:09:46 PM
    Author     : Acer
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Staff Registration</title>
<link rel="stylesheet" href="css/staffreg.css">
</head>
<body>
    <div class="wrapper">
        <div class="left-side">
            <h2>Staff Registration</h2>
            <form action="staffServlet?action=register"  method="post">
                <div class="input-box">
                    <input type="text" id="staff_name" name="staff_name" placeholder="Staff Name" required>
                </div>
                <div class="input-box">
                    <input type="text" id="staff_username" name="staff_username" placeholder="Staff Username" required>
                </div>
                <div class="input-box">
                    <input type="password" id="password" name="password" placeholder="Password" required>
                </div>
                <div class="input-box">
                    <input type="text" id="phone_number" name="phone_number" placeholder="Phone Number" required>
                </div>
                <div class="input-box">
                    <input type="email" id="staff_email" name="staff_email" placeholder="Staff Email" required>
                </div>
                <div class="input-box button">
                    <input type="submit" value="Register">
                </div>
                <div class="text">
                    <h3>Already have an account? <a href="staffLogin.jsp">Login now</a></h3>
                </div>
            </form>
        </div>
        <div class="right-side">
            <img src="images/towing.png" alt="Image">
        </div>
    </div>
</body>
</html>




