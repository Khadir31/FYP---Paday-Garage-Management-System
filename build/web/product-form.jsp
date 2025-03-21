<%-- 
    Document   : product-form
    Created on : 1 Jul 2024, 2:29:41 PM
    Author     : Acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Form</title>
</head>
<body>
    <h1>${product == null ? "New Product" : "Edit Product"}</h1>
    <form action="product?action=${product == null ? 'insert' : 'update'}" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${product.productId}">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${product.productName}">
        <br><br>
        <label for="description">Description:</label>
        <textarea id="description" name="description">${product.productDescription}</textarea>
        <br><br>
        <label for="image">Image:</label>
        <input type="file" id="image" name="image">
        <br><br>
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" value="${product.productPrice}">
        <br><br>
        <label for="stock">Stock:</label>
        <input type="text" id="stock" name="stock" value="${product.productStock}">
        <br><br>
        <input type="submit" value="Submit">
    </form>
    <br>
    <a href="product?action=list">Back to List</a>
</body>
</html>
