<%-- 
    Document   : product-list
    Created on : 1 Jul 2024, 2:28:47 PM
    Author     : Acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
    <a href="product?action=new">Add New Product</a>
    <table border="1" width="100%">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Image</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="product" items="${listProduct}">
            <tr>
                <td>${product.productId}</td>
                <td>${product.productName}</td>
                <td>${product.productDescription}</td>
                <td>
                    <c:if test="${not empty product.productImage}">
                        <img src="data:image/jpeg;base64,${fn:escapeXml(product.productImage)}" alt="Product Image" width="100" height="100" />
                    </c:if>
                </td>
                <td>${product.productPrice}</td>
                <td>${product.productStock}</td>
                <td>
                    <a href="product?action=edit&id=${product.productId}">Edit</a>
                    <a href="product?action=delete&id=${product.productId}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
