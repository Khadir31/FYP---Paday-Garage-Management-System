<%-- 
    Document   : invalidLogin
    Created on : 20 Jan 2024, 7:59:45 PM
    Author     : Acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invalid Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e74c3c; /* Red background */
            color: white; /* Text color */
            text-align: center;
            margin: 100px;
        }

        h2 {
            color: #fff; /* White text color */
        }

        p {
            color: #fff; /* White text color */
            font-size: 18px;
            margin-bottom: 20px;
        }

        button {
            background-color: #3498db; /* Blue button color */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }

        button:hover {
            background-color: #2980b9; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <h2>Invalid Login</h2>
    <p>Invalid username or password</p>
    <button onclick="redirectToLogin()">Re-Login</button>

    <script>
        function redirectToLogin() {
            window.location.href = "login.jsp";
        }
    </script>
</body>
</html>

