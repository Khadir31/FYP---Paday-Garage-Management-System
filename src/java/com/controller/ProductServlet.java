/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.ProductDAO;
import com.model.Cart;
import com.model.products;
import com.utils.ConnectionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/productServlet")
@MultipartConfig(maxFileSize = 16177215)  // Max file size for image upload
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = null;
        try {
            connection = ConnectionUtils.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        productDAO = new ProductDAO(connection);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "add":
                    addProduct(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                case "list":
                    listProducts(request, response);
                    break;
                case "userListProducts":
                    userListProducts(request, response);
                    break;
                case "image":
                    showProductImage(request, response);
                    break;
                case "addToCart":
                    addToCart(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
    }

    private void userListProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException, ClassNotFoundException {
        List<products> productList = productDAO.getAllProducts();
        request.setAttribute("products", productList);
        request.getRequestDispatcher("userProductList.jsp").forward(request, response);
    }

    // Add a new product
    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException, ClassNotFoundException {
        String name = request.getParameter("productName");
        String description = request.getParameter("productDescription");
        Part filePart = request.getPart("productImage");
        InputStream inputStream = null;
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        BigDecimal price = new BigDecimal(request.getParameter("productPrice"));
        int stock = Integer.parseInt(request.getParameter("productStock"));

        Blob imageBlob = null;
        if (inputStream != null) {
            imageBlob = new javax.sql.rowset.serial.SerialBlob(inputStream.readAllBytes());
        }

        products newProduct = new products();
        newProduct.setProductName(name);
        newProduct.setProductDescription(description);
        newProduct.setProductImage(imageBlob);
        newProduct.setProductPrice(price);
        newProduct.setProductStock(stock);

        productDAO.addProduct(newProduct);
        response.sendRedirect("productServlet?action=list");
    }

    // Update an existing product
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("productName");
        String description = request.getParameter("productDescription");
        Part filePart = request.getPart("productImage");
        InputStream inputStream = null;
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        BigDecimal price = new BigDecimal(request.getParameter("productPrice"));
        int stock = Integer.parseInt(request.getParameter("productStock"));

        Blob imageBlob = null;
        if (inputStream != null) {
            imageBlob = new javax.sql.rowset.serial.SerialBlob(inputStream.readAllBytes());
        }

        products updatedProduct = new products();
        updatedProduct.setProductId(id);
        updatedProduct.setProductName(name);
        updatedProduct.setProductDescription(description);
        updatedProduct.setProductImage(imageBlob);
        updatedProduct.setProductPrice(price);
        updatedProduct.setProductStock(stock);

        productDAO.updateProduct(updatedProduct);
        response.sendRedirect("productServlet?action=list");
    }

    // Delete a product
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        productDAO.deleteProduct(id);
        response.sendRedirect("productServlet?action=list");
    }

    // List all products
    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException, ClassNotFoundException {
        List<products> productList = productDAO.getAllProducts();
        request.setAttribute("products", productList);
        request.getRequestDispatcher("listProducts.jsp").forward(request, response);
    }

    // Show edit form for a product
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        products existingProduct = productDAO.getProductById(id);
        request.setAttribute("product", existingProduct);
        request.getRequestDispatcher("editProduct.jsp").forward(request, response);
    }

    // Show product image
    private void showProductImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        products product = productDAO.getProductById(id);
        Blob imageBlob = product.getProductImage();
        if (imageBlob != null) {
            response.setContentType("image/jpeg");
            try (InputStream inputStream = imageBlob.getBinaryStream();
                 OutputStream outputStream = response.getOutputStream()) {
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }
        }
    }
      private void addToCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException, ClassNotFoundException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        products product = productDAO.getProductById(productId);
        String productName = product.getProductName();
        BigDecimal productPrice = product.getProductPrice();

        Cart cart = new Cart(0, userId, productId, productName, quantity, productPrice, productPrice.multiply(BigDecimal.valueOf(quantity)));
        productDAO.addToCart(cart);

        response.sendRedirect("userProductList.jsp");
    }

}
        
    

    




