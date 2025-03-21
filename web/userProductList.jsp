<%-- 
    Document   : userProduct
    Created on : 2 Jul 2024, 2:39:55 AM
    Author     : Acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Product List</title>
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
        .button-like-link {
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
            background-color: #3498db;
        }
        .button-like-link:hover {
            background-color: #2980b9;
        }
        .btn-back {
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
            background-color: #95a5a6;
        }
        .btn-back:hover {
            background-color: #7f8c8d;
        }
        .cart-container {
            margin-top: 30px;
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #e0e0e0;
        }
        .quantity-input {
            width: 50px;
            margin-left: 10px;
        }
        .btn {
            padding: 5px 10px;
            margin-left: 10px;
        }
        #total-price {
            margin-top: 20px;
            font-size: 1.5em;
            font-weight: bold;
        }
    </style>
    <script>
        // JavaScript functions to manage the cart
        let cart = {}; // Initialize an empty cart object

        // Function to add an item to the cart
        function addToCart(itemId, itemName, itemPrice) {
            // Get the quantity input element for the specified item
            const quantityElement = document.getElementById('quantity-' + itemId);
            const quantity = parseInt(quantityElement.value); // Parse the quantity value as an integer
            const itemPriceFloat = parseFloat(itemPrice); // Parse the item price as a float

            console.log('Adding to cart:', itemId, itemName, itemPrice, quantity); // Debugging line

            if (cart[itemId]) {
                // If the item is already in the cart, update its quantity and subtotal
                const existingItem = cart[itemId];
                existingItem.quantity += quantity;
                existingItem.subtotal = existingItem.quantity * itemPriceFloat;
            } else {
                // If the item is not in the cart, add it as a new entry
                cart[itemId] = {
                    name: itemName,
                    price: itemPriceFloat,
                    quantity: quantity,
                    subtotal: itemPriceFloat * quantity,
                    itemId: itemId
                };
            }

            // Render the cart after updating
            renderCart();
        }

        // Function to render the cart items in the HTML
        function renderCart() {
            const cartItemsElement = document.getElementById('cart-items'); // Get the cart items container element
            const totalPriceElement = document.getElementById('total-price'); // Get the total price element
            let totalPrice = 0;

            cartItemsElement.innerHTML = ''; // Clear current cart display

            // Iterate over the cart items and create HTML elements for each item
            Object.keys(cart).forEach(itemId => {
                const item = cart[itemId];
                const cartItemElement = document.createElement('div');
                cartItemElement.classList.add('cart-item');

                const itemNameSpan = document.createElement('span');
                itemNameSpan.textContent = item.name;

                const quantityInput = document.createElement('input');
                quantityInput.type = 'number';
                quantityInput.classList.add('quantity-input');
                quantityInput.value = item.quantity;
                quantityInput.min = '1';
                quantityInput.onchange = function() {
                    updateCartItem(itemId, this.value); // Update the item quantity when changed
                };

                const subtotalSpan = document.createElement('span');
                subtotalSpan.textContent = 'RM ' + item.price.toFixed(2);
                cartItemElement.appendChild(itemNameSpan);
                cartItemElement.appendChild(subtotalSpan);
                cartItemElement.appendChild(quantityInput);

                const subtotalValueSpan = document.createElement('span');
                subtotalValueSpan.textContent = ` = RM ` + item.subtotal.toFixed(2);
                cartItemElement.appendChild(subtotalValueSpan);

                const removeButton = document.createElement('button');
                removeButton.classList.add('btn', 'btn-danger', 'btn-sm');
                removeButton.textContent = 'Remove';
                removeButton.onclick = function() {
                    removeCartItem(itemId); // Remove the item from the cart when clicked
                };
                cartItemElement.appendChild(removeButton);

                cartItemsElement.appendChild(cartItemElement);

                totalPrice += item.subtotal; // Update the total price
            });

            totalPriceElement.innerText = 'RM ' + totalPrice.toFixed(2); // Display the total price
        }

        // Function to update the quantity of an item in the cart
        function updateCartItem(itemId, newQuantity) {
            const item = cart[itemId];
            newQuantity = parseInt(newQuantity);

            if (newQuantity > 0) {
                // Update the item quantity and subtotal if the new quantity is greater than zero
                item.quantity = newQuantity;
                item.subtotal = item.price * newQuantity;
            } else {
                // Remove the item from the cart if the new quantity is zero or less
                delete cart[itemId];
            }

            renderCart(); // Update cart display
        }

        // Function to remove an item from the cart
        function removeCartItem(itemId) {
            delete cart[itemId]; // Delete the item from the cart object
            renderCart(); // Update cart display
        }

        // Function to confirm payment and send order data to the server
        function confirmPayment() {
            const totalPriceElement = document.getElementById('total-price'); // Get the total price element
            const totalPrice = parseFloat(totalPriceElement.innerText.replace('RM', '').trim()); // Parse the total price
            const tableNo = document.getElementById('tableNumber').value; // Get the table number

            const orderData = {
                cart: Object.values(cart), // Convert cart object to an array
                total: totalPrice,
                tableNo: tableNo
            };
            window.location.href = 'payment.jsp';

            // Send order data to the servlet
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'OrderServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText); // Parse the server response

                    if (response.status === 'success') {
                        alert('Order placed successfully!');
                        cart = {}; // Clear the cart
                        renderCart(); // Update cart display
                        window.location.href = "payment.jsp"; // Redirect to payment page
                    } else {
                        alert('Failed to place order.');
                        window.location.href = "payment.jsp"; // Redirect to payment page
                    }
                }
            };
            xhr.send(JSON.stringify(orderData)); // Send the order data
        }

        // Function to insert an order (not used in the provided code)
        function insertOrder(total, tableNo) {
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'OrderServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

            const orderData = {
                cart,
                total,
                tableNo,
                customerId: '<%= session.getAttribute("customerId") %>'
            };

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    alert('Order placed successfully!');
                    cart.length = 0; // Clear the cart
                    renderCart(); // Update cart display
                }
            };

            xhr.send(JSON.stringify(orderData));
            
             // Immediate redirection to payment.jsp
    window.location.href = 'payment.jsp';
        }

        // Function to toggle the description of an item
        function toggleDescription(itemId) {
            const descriptionBox = document.getElementById('description-' + itemId);
            const seeMoreButton = descriptionBox.querySelector('.see-more');

            if (descriptionBox.classList.contains('collapsed')) {
                // Expand the description box
                descriptionBox.style.maxHeight = descriptionBox.scrollHeight + "px";
                descriptionBox.classList.remove('collapsed');
                seeMoreButton.textContent = 'See less';
            } else {
                // Collapse the description box
                descriptionBox.style.maxHeight = '60px'; // Initial collapsed height
                descriptionBox.classList.add('collapsed');
                seeMoreButton.textContent = 'See more';
            }
        }

        // Function to confirm logout
        function confirmLogout() {
            if (confirm("Are you sure you want to log out? :(")) {
                alert("Thank you for using our services!");
                window.location.href = "logout"; // Redirect to logout servlet or page
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Product List</h2>
    <table border="1" cellspacing="0" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Image</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.productId}</td>
                <td>${product.productName}</td>
                <td>${product.productDescription}</td>
                <td>RM ${product.productPrice}</td>
                <td>${product.productStock}</td>
                <td>
                    <c:if test="${product.productImage != null}">
                        <img src="productServlet?action=image&id=${product.productId}" alt="Product Image"/>
                    </c:if>
                </td>
                <td>
                    <input type="number" id="quantity-${product.productId}" value="1" min="1" class="quantity-input">
                </td>
                <td>
                    <button class="button-like-link" onclick="addToCart('${product.productId}', '${product.productName}', '${product.productPrice}')">Add to Cart</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="userhome.jsp" class="btn-back">Back to Homepage</a>

    <div class="cart-container">
        <h2>Shopping Cart</h2>
        <div id="cart-items"></div>
        <div id="total-price">Total: RM 0.00</div>
        <a href="paymentPage.jsp" class="btn-back">Order Now</a>
    </div>
</div>
</body>
</html>

