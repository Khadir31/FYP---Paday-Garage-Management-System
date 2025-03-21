<%-- 
    Document   : login
    Created on : 9 Jun 2024, 3:06:14 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Form</title>
  <link rel="stylesheet" href="login.css">
</head>
<body>
  <div class="wrapper">
     <form action="userServlet?action=login" method="post">
        
      <h2>Login</h2>
        <div class="input-field">
        <input type="email" id="email" name="email" >
        <label>Enter your email</label>
      </div>
      <div class="input-field">
        <input input type="password" id="password" name="password">
        <label>Enter your password</label>
      </div>
      <button type="submit" value="Login">Log In</button>
      <div class="register">
        <p>Don't have an account? <a href="userRegister.jsp">Register</a></p>
      </div>
    </form>
  </div>
</body>
</html>
