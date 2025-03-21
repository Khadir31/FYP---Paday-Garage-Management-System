/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.model.Cart;
import com.model.products;
import com.utils.ConnectionUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private Connection connection;

    // Constructor to initialize connection
    public ProductDAO(Connection connection) {
        this.connection = connection;
    }

    public ProductDAO() {
    }

    // Method to add a new product
    public void addProduct(products product) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO products (product_name, product_description, product_image, product_price, product_stock) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = ConnectionUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, product.getProductName());
            statement.setString(2, product.getProductDescription());
            statement.setBlob(3, product.getProductImage());
            statement.setBigDecimal(4, product.getProductPrice());
            statement.setInt(5, product.getProductStock());
            statement.executeUpdate();
        }
    }

    // Method to update an existing product
    public void updateProduct(products product) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE products SET product_name = ?, product_description = ?, product_image = ?, product_price = ?, product_stock = ? WHERE product_id = ?";
        try (Connection connection = ConnectionUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, product.getProductName());
            statement.setString(2, product.getProductDescription());
            statement.setBlob(3, product.getProductImage());
            statement.setBigDecimal(4, product.getProductPrice());
            statement.setInt(5, product.getProductStock());
            statement.setInt(6, product.getProductId());
            statement.executeUpdate();
        }
    }

    // Method to delete a product by ID
    public void deleteProduct(int productId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM products WHERE product_id = ?";
        try (Connection connection = ConnectionUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, productId);
            statement.executeUpdate();
        }
    }

    // Method to get a product by ID
    public products getProductById(int productId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        try (Connection connection = ConnectionUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new products(
                        resultSet.getInt("product_id"),
                        resultSet.getString("product_name"),
                        resultSet.getString("product_description"),
                        resultSet.getBlob("product_image"),
                        resultSet.getBigDecimal("product_price"),
                        resultSet.getInt("product_stock")
                );
            }
        }
        return null;
    }

    // Method to get all products
    public List<products> getAllProducts() throws SQLException, ClassNotFoundException {
        List<products> productList = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection connection = ConnectionUtils.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                products product = new products(
                        resultSet.getInt("product_id"),
                        resultSet.getString("product_name"),
                        resultSet.getString("product_description"),
                        resultSet.getBlob("product_image"),
                        resultSet.getBigDecimal("product_price"),
                        resultSet.getInt("product_stock")
                );
                productList.add(product);
            }
        }
        return productList;
    }
    public void addToCart(Cart cart) throws SQLException {
        String sql = "INSERT INTO cart (user_id, product_id, product_name, quantity, product_price, total_price) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, cart.getUserId());
            statement.setInt(2, cart.getProductId());
            statement.setString(3, cart.getProductName());
            statement.setInt(4, cart.getQuantity());
            statement.setBigDecimal(5, cart.getProductPrice());
            statement.setBigDecimal(6, cart.getTotalPrice());
            statement.executeUpdate();
        }
    }
    

}



