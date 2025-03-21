/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.model.Payment;
import com.utils.ConnectionUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {
    // Database connection details
    private String jdbcURL = "jdbc:mysql://localhost:3306/pgms";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
     // SQL queries
    private static final String UPDATE_PAYMENT_STATUS_SQL = "UPDATE payments SET status = ? WHERE payment_id = ?";
    // Constructor
    public PaymentDAO() {}
    // Method to establish database connection
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertPayment(Payment payment) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO payments (user_id, total_price, image, status) VALUES (?, ?, ?, ?)";

        try (Connection connection = ConnectionUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, payment.getUserId());
            statement.setBigDecimal(2, payment.getTotalPrice());
            statement.setBlob(3, payment.getImage());
            statement.setString(4, payment.getStatus());

            statement.executeUpdate();
        }
    }

    public List<Payment> getAllPayments() throws SQLException, ClassNotFoundException {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT * FROM payments";

        try (Connection connection = ConnectionUtils.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Payment payment = new Payment();
                payment.setPaymentId(resultSet.getInt("payment_id"));
                payment.setUserId(resultSet.getInt("user_id"));
                payment.setTotalPrice(resultSet.getBigDecimal("total_price"));
                payment.setImage(resultSet.getBinaryStream("image"));
                payment.setStatus(resultSet.getString("status"));
                payments.add(payment);
            }
        }
        return payments;
    }

    public boolean updatePaymentStatus(int paymentId, String status) throws SQLException, ClassNotFoundException {
        try (Connection connection = ConnectionUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PAYMENT_STATUS_SQL)) {

            statement.setString(1, status);
            statement.setInt(2, paymentId);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        }
    }
}


