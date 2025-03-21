<%-- 
    Document   : register
    Created on : 9 Jun 2024, 3:38:48 PM
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
     <form action="userServlet?action=register" method="post">
      <h2>Register</h2>
        <div class="input-field">
        <input type="text" id="username" name="username" >
        <label>Enter your Username</label>
      </div>
      <div class="input-field">
        <input input type="password" id="password" name="password">
        <label>Enter your password</label>
      </div>
      <div class="input-field">
        <input input type="email" id="email" name="email">
        <label>Enter your e-mail</label>
      </div>
      <div class="input-field">
        <input input type="tel" id="phoneNumber" name="phoneNumber">
        <label>Enter your phone number</label>
      </div>
      <button type="submit" value="Register">Register</button>
      <div class="register">
        <p>Already have an account? <a href="userLogin.jsp">Login</a></p>
      </div>
    </form>
  </div>
    <script type="text/javascript">
    // Function to get query parameters by name
    function getQueryParameter(name) {
      const urlParams = new URLSearchParams(window.location.search);
      return urlParams.get(name);
    }

    // Check if the 'message' query parameter is present
    const message = getQueryParameter('message');
    if (message) {
      // Display the message in a popup
      alert(message);
    }
  </script>
</body>
</html>