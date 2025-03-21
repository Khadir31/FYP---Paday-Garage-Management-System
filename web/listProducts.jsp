<%-- 
    Document   : listProducts
    Created on : 30 Jun 2024, 4:49:20 PM
    Author     : Acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    
</head>
<body>
<h2>Product List</h2>
<div class="form-group">
    <a href="addProduct.jsp" class="button-like-link">Add New Product</a>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5em;
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
        .button-like-link, .btn-back {
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
        .button-like-link {
            background-color: #3498db;
        }
        .button-like-link:hover {
            background-color: #2980b9;
        }
        .btn-back {
            background-color: #95a5a6;
        }
        .btn-back:hover {
            background-color: #7f8c8d;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        th {
            background-color: #34495e;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        img {
            max-width: 100px;
            max-height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }
        .action-link {
            display: inline-block;
            padding: 5px 10px;
            margin: 2px;
            border-radius: 3px;
            text-decoration: none;
            color: #fff;
            font-size: 0.9em;
        }
        .edit-link {
            background-color: #f39c12;
        }
        .edit-link:hover {
            background-color: #e67e22;
        }
        
        .delete-link {
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
        .delete-link {
            background-color: #c0392b;
        }
        
    </style>
</div>
<table border="1" cellspacing="0" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Stock</th>
        <th>Image</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.productId}</td>
            <td>${product.productName}</td>
            <td>${product.productDescription}</td>
            <td>${product.productPrice}</td>
            <td>${product.productStock}</td>
            <td>
                <c:if test="${product.productImage != null}">
                    <img src="productServlet?action=image&id=${product.productId}" alt="Product Image" width="100" height="100"/>
                </c:if>
            </td>
            <td>
                <a href="productServlet?action=edit&id=${product.productId}" class="button-like-link">Edit</a>
                <a href="productServlet?action=delete&id=${product.productId}" onclick="return confirm('Are you sure you want to delete this product?');" class="delete-link">Delete</a>
                
         <!--    <   <div class="form-group">
                        <label for="product1">Product 2:</label>
                        <a href="productServlet?action=list" class="button-like-link">Edit Product</a>
                    </div> -->
            </td>
        </tr>
    </c:forEach>
</table>
<a href="staffdb.jsp" class="btn-back">Back to Homepage</a>
<!-- Bootstrap JS (optional, for certain components) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


