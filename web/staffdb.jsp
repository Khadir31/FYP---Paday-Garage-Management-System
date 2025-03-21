<%-- 
    Document   : staffdb
    Created on : 12 Jun 2024, 12:42:16 AM
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
        <title>Admin Dashboard</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
            }
            .sidebar {
                width: 250px;
                background-color: #ff4c4c;
                padding: 20px;
                box-shadow: 2px 0 5px rgba(0,0,0,0.1);
                position: fixed;
                height: 100%;
                top: 0;
                left: 0;
                overflow: auto;
            }
            .sidebar h2 {
                color: #fff;
                text-align: center;
            }
            .sidebar a {
                display: block;
                color: #fff;
                padding: 10px;
                text-decoration: none;
                margin: 10px 0;
            }
            .sidebar a:hover {
                background-color: #ff7b7b;
            }
            .content {
                margin-left: 270px;
                padding: 20px;
                width: calc(100% - 270px);
            }
            .container {
                width: 80%;
                margin: 0 auto;
            }
            h1, h2 {
                text-align: center;
            }
            .section {
                background-color: #fff;
                padding: 20px;
                margin: 20px 0;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .section h2 {
                margin-top: 0;
            }
            .form-group {
                margin: 10px 0;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
            }
            .form-group button {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                box-sizing: border-box;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .form-group button:hover {
                background-color: #0056b3;
            }
            .btn {
                display: inline-block;
                padding: 10px 20px;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
            }
            .btn:hover {
                background-color: #0056b3;
            }
            .button-like-link {
                display: inline-block;
                padding: 10px 15px;
                color: white;
                background-color: #007BFF; /* Primary blue */
                border-radius: 4px;
                text-decoration: none;
                text-align: center;
                border: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h2>Admin Dashboard</h2>
            <a href="staffprof.jsp">Update Profile</a>
            <a href="productServlet?action=list" >Manage Products</a>
            <a href="adminAppointment.jsp">Manage Appointments</a>
            <a href="managePayments.jsp">Manage Payments</a>
            <a href="LogoutServlet" style="margin-top: 20px;">Logout</a>
        </div>
        <div class="content">
            <div class="container">
                <h1>Welcome, <%= staffMember.getStaff_name()%>!</h1>
                <p>This is your staff dashboard.</p>

                <!-- Admin Profile Section -->
                <div class="section">
                    <h2>Admin Profile</h2>
                    <p>Name: <%= staffMember.getStaff_name()%></p>
                </div>

                <!-- Manage Products Section -->
                <div class="section" id="manage-products">
                    <h2>Manage Products</h2>
                    <div class="form-group">
                        <label for="product1">Product 1:</label>
                        <a href="addProduct.jsp" class="button-like-link">Add Product</a>
                    </div>
                    <div class="form-group">
                        <label for="product1">Product 2:</label>
                        <a href="productServlet?action=list" class="button-like-link">Edit Product</a>
                    </div>
                  <!--  <form action="productServlet?action=list" method="post">
                        <div class="form-group">
                            <label for="product4">Product 4:</label>
                            <button type="submit" id="product4" name="product4">Add Product 4</button>
                        </div>
                    </form> -->
                </div>

                <!-- Manage Appointments Section -->
                <div class="section">
                    <h2>Manage Appointments</h2>
                    <form action="adminAppointment.jsp" method="post">
                        <button type="submit" class="btn">Manage Appointments</button>
                    </form>
                </div>

                <!-- Approve Payments Section -->
                <div class="section">
                    <h2>Approve Payments</h2>
                    <a href="paymentServlet?action=getPayment" >
                        <button type="submit" class="btn">Approve Payments</button>
                    </a>
                        
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

