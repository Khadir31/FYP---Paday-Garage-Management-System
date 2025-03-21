<%-- 
    Document   : payment
    Created on : 19 Jan 2024, 10:35:21 PM
    Author     : Acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <style>
        /* Add your styles here */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #3498db;
            text-align: center;
            color: white;
            margin: 50px;
        }

        h2 {
            color: #ffffff;
        }

        p {
            color: #ffffff;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 8px;
            color: #333;
        }
        

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Make Payment</h2>
    
    <form action="ProcessPaymentServlet" method="post" enctype="multipart/form-data">
        <label for="qrCode">QR Code:</label>
        <img src="images/QRpay.jpeg" alt="logo" style="width:190px;height:220px;"><p> <class="QRpay">

        <label for="bankNumber">Account Number:</label>
        <span id="bankNumber" style="color: black;">1122 3344 5566 7788</span>



        <label for="receipt">Upload Receipt:</label>
        <input type="file" id="receipt" name="receipt" accept="image/*" required><br>

        <button type="submit">Submit </button>
    </form>
</body>
</html>

