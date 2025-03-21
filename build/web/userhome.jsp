<%-- 
    Document   : amazonwebpg
    Created on : 2 May 2024, 8:05:29 AM
    Author     : Acer
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Paday Garage</title>
  <link rel="stylesheet" href="css/userhome.css">
  <script src="js/userhome.js" defer></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
  <header>
    <nav class="navbar">
      <div class="nav-logo">
        <a href="#"><img src="images/pglogo.png" alt="logo"></a>
      </div>
     
      <div class="sign-in">
        <c:if test="${empty sessionScope.user}">
          <a href="userLogin.jsp">Login</a>
        </c:if>
        <c:if test="${not empty sessionScope.user}">
          <a href="updateProfile.jsp">
            <p>Hye ${sessionScope.user.username}!</p>
            <span><strong>Welcome To Paday Garage</strong></span>
          </a>
        </c:if>
      </div>
      <div class="cart">
        <a href="#">
          <span class="material-symbols-outlined cart-icon">shopping_cart</span>
        </a>
        <p>Cart</p>
      </div>
    </nav>
    <div class="banner">
      <div class="banner-content">
        <div class="panel">
          
        </div>
        
      </div>
    </div>
  </header>

  <section class="shop-section">
    <h2>Popular Spareparts</h2>
    <div class="shop-images">
      
      <div class="shop-link">
        <h3>Update Profile</h3>
        <img src="images/upProf.jpg" alt="card">
        <a href="updateProfile.jsp">Update your Profile</a>
      </div>
        <div class="shop-link">
        <h3>Make Appointment</h3>
        <img src="images/userhome.png" alt="card">
        <a href="userAppointment.jsp">Make Appointment Now</a>
      </div>
      <div class="shop-link">
    <h3>View Products</h3>
    <img src="images/sparepart.png" alt="card">
    <a href="productServlet?action=userListProducts">Go to view product page</a>
</div>

      
    </div>
  </section>

  <footer>
    <a href="#" class="footer-title">Back to top</a>
    <div class="footer-items">
      <ul>
        <h3>Get to Know Us</h3>
        <li><a href="#">About us</a></li>
      </ul>
      <ul>
        <h3>Connect with Us</h3>
        <li><a href="https://www.facebook.com/PADAYGARAGE/">Facebook</a></li>
        <li><a href="https://www.youtube.com/@padaygaragechannel466?app=desktop">YouTube</a></li>
      </ul>
    </div>
  </footer>

  <script>
    let slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
      showSlides(slideIndex += n);
    }

    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      let i;
      let slides = document.getElementsByClassName("mySlides");
      let dots = document.getElementsByClassName("dot");
      if (n > slides.length) {slideIndex = 1}
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block";  
      dots[slideIndex-1].className += " active";
    }
  </script>
</body>
</html>

