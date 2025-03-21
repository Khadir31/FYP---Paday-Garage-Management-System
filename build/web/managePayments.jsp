<%-- 
    Document   : managePayments
    Created on : 3 Jul 2024, 7:42:39 AM
    Author     : Acer
--%>
<%@ page import="com.model.Payment" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Payments</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 40px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            button {
                padding: 5px 10px;
                background-color: blue;
                color: white;
                border: none;
                cursor: pointer;
            }
            button:hover {
                background-color: darkblue;
            }
        </style>
    </head>
    <body>
        <h1>Manage Payments</h1>
        <table>
            <tr>
                <th> Payment ID</th>
                <th>User ID</th>
                <th>Receipt Image</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>Acrion button (not work yet...)</th>
            </tr>
            <%
                List<Payment> payments = (List<Payment>) request.getAttribute("payments");
                if (payments != null) {
                    for (Payment payment : payments) {
            %>
            <tr>
                <td><%= payment.getPaymentId()%></td>
                <td><%= payment.getUserId()%></td>
                <td><img src="paymentServlet?action=image&paymentId=<%= payment.getPaymentId()%>" alt="Payment Image" width="100" height="100"/></td>
                <td><%= payment.getTotalPrice()%></td>
                <td><%= payment.getStatus()%></td>
                <td>
    <% if (!"Approved".equals(payment.getStatus()) && !"Rejected".equals(payment.getStatus())) { %>
        <form action="paymentServlet" method="post" style="display:inline;">
            <input type="hidden" name="action" value="updateStatus">
            <input type="hidden" name="paymentId" value="<%= payment.getPaymentId() %>">
            <button type="submit" name="status" value="Approved">Approve</button>
        </form>
        <form action="paymentServlet" method="post" style="display:inline;">
            <input type="hidden" name="action" value="updateStatus">
            <input type="hidden" name="paymentId" value="<%= payment.getPaymentId() %>">
            <button type="submit" name="status" value="Rejected">Reject</button>
        </form>
    <% } else { %>
        <button class="btn-disabled">Processed</button>
    <% } %>
</td>

            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="7">No payments found.</td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>

