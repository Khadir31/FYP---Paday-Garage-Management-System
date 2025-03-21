<%-- 
    Document   : paymentPage
    Created on : 3 Jul 2024, 12:55:09 AM
    Author     : Acer
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Form</title>
    <%
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("login.jsp"); // Redirect to login page if userId is not found
            }
        %>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        form { width: 300px; margin: 0 auto; }
        label { display: block; margin-bottom: 10px; }
        input, button { width: 100%; padding: 10px; margin-bottom: 20px; }
        button { background-color: blue; color: white; border: none; cursor: pointer; }
        button:hover { background-color: darkblue; }
    </style>
</head>
<body>
    <h1>Submit Payment</h1>
    <form action="paymentServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" id="userId" name="userId" value="<%= userId %>">
        <label for="qrCode">QR Code:</label>
        <img src="images/QRpay.jpeg" alt="logo" style="width:190px;height:220px;"><p> <class="QRpay">
        <label for="totalPrice">Total Price:</label>
        <input type="text" id="totalPrice" name="totalPrice" required>

        <label for="image">Upload Image:</label>
        <input type="file" id="image" name="image" accept="image/*" required>

        <button type="submit">Submit Payment</button>
    </form>
</body>
</html>


