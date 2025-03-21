<%-- 
    Document   : profilesuccess
    Created on : 18 Jan 2024, 8:28:22 PM
    Author     : Acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Updated Successfully</title>
    <style>
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

        .success-message {
            background-color: #2ecc71;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }

        button {
            background-color: #2980b9;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #21618c;
        }
    </style>
</head>
<body>
    <h2>Profile Updated Successfully</h2>

    <div class="success-message">
        <p>Your profile has been updated successfully!</p>
    </div>

    <button onclick="window.location.href='userhome.jsp'">Go to Homepage</button>
</body>
</html>
