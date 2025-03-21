<%-- 
    Document   : editProduct
    Created on : 30 Jun 2024, 4:50:31 PM
    Author     : Acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f7f6;
        color: #333;
        line-height: 1.6;
        padding: 20px;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    .wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
        max-width: 800px;
        width: 100%;
        background: #fff;
        padding: 34px;
        border-radius: 6px;
        box-shadow: 0 5px 10px rgba(0,0,0,0.2);
    }
    .left-side, .right-side {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .right-side img {
        max-width: 100%;
        height: auto;
    }
    h2 {
        font-size: 22px;
        font-weight: 600;
        color: #333;
        position: relative;
        margin-bottom: 20px;
        text-align: center;
    }
    h2::before {
        content: '';
        position: absolute;
        left: 50%;
        bottom: -10px;
        height: 3px;
        width: 28px;
        border-radius: 12px;
        background: #4070f4;
        transform: translateX(-50%);
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        max-width: 400px;
    }
    .input-box {
        margin: 18px 10px;
        width: 100%;
    }
    .input-box input, textarea {
        height: 100%;
        width: 100%;
        outline: none;
        padding: 0 15px;
        font-size: 17px;
        font-weight: 400;
        color: #333;
        border: 1.5px solid #C7BEBE;
        border-bottom-width: 2.5px;
        border-radius: 6px;
        transition: all 0.3s ease;
    }
    textarea {
        padding: 10px 15px;
        height: 100px;
        resize: vertical;
    }
    input[type="submit"] {
        background-color: #3498db;
        color: white;
        border: none;
        padding: 12px 20px;
        margin-top: 20px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    input[type="text"] {
        padding: 10px;
        padding-left: 40px;
        padding-right: 40px;
    }
    input[type="submit"]:hover {
        background-color: #2980b9;
    }
    .btn-back {
        display: inline-block;
        background-color: #95a5a6;
        color: white;
        text-decoration: none;
        padding: 10px 15px;
        border-radius: 4px;
        margin-top: 20px;
        transition: background-color 0.3s ease;
        text-align: center;
    }
    .btn-back:hover {
        background-color: #7f8c8d;
    }
</style>
</head>
<body>
<div class="wrapper">
<form action="productServlet?action=update" method="post" enctype="multipart/form-data">
    <h2>Edit Product</h2>
    <input type="hidden" name="productId" value="${product.productId}">
    <label for="productName">Product Name:</label><br>
    <input type="text" id="productName" name="productName" value="${product.productName}"><br>
    <label for="productDescription">Product Description:</label><br>
    <textarea id="productDescription" name="productDescription">${product.productDescription}</textarea><br>
    <label for="productImage">Product Image:</label><br>
    <input type="file" id="productImage" name="productImage"><br>
    <label for="productPrice">Product Price:</label><br>
    <input type="text" id="productPrice" name="productPrice" value="${product.productPrice}"><br>
    <label for="productStock">Product Stock:</label><br>
    <input type="text" id="productStock" name="productStock" value="${product.productStock}"><br>
    <input type="submit" value="Update Product">
     <a href="staffdb.jsp" class="btn-back">Back to Homepage</a>
</form>
</div>
</body>
</html>

