/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.model.staff;
import com.utils.ConnectionUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StaffDAO {
    // Database connection details
    private String jdbcURL = "jdbc:mysql://localhost:3306/pgms";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    // SQL queries
    private static final String INSERT_USERS_SQL = "INSERT INTO staff (staff_name, staff_username, password, phone_number, staff_email) VALUES (?, ?, ?, ?, ?);";
    private static final String UPDATE_STAFF_SQL = "UPDATE staff SET staff_name = ?, staff_username = ?, password = ?, phone_number = ?, staff_email = ? WHERE staff_id = ?";

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

    // Method to register a new staff member
    public int registerStaff(staff staff) throws ClassNotFoundException {
        int result = 0;

        try (Connection connection = ConnectionUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, staff.getStaff_name());
            preparedStatement.setString(2, staff.getStaff_username());
            preparedStatement.setString(3, staff.getPassword());
            preparedStatement.setString(4, staff.getPhone_number());
            preparedStatement.setString(5, staff.getStaff_email());

            // Execute the insert statement
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    // Method to validate staff login
    public staff validateStaffLogin(String email, String password) {
        staff staffMember = null;
        String query = "SELECT * FROM staff WHERE staff_email = ? AND password = ?";

        try (Connection connection = ConnectionUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                staffMember = new staff();
                staffMember.setStaff_id(resultSet.getInt("staff_id"));
                staffMember.setStaff_name(resultSet.getString("staff_name"));
                staffMember.setStaff_username(resultSet.getString("staff_username"));
                staffMember.setPassword(resultSet.getString("password"));
                staffMember.setPhone_number(resultSet.getString("phone_number"));
                staffMember.setStaff_email(resultSet.getString("staff_email"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return staffMember;
    }

    // Method to update staff member details in the database
    public void updateStaff(staff staffMember) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STAFF_SQL)) {
            preparedStatement.setString(1, staffMember.getStaff_name());
            preparedStatement.setString(2, staffMember.getStaff_username());
            preparedStatement.setString(3, staffMember.getPassword());
            preparedStatement.setString(4, staffMember.getPhone_number());
            preparedStatement.setString(5, staffMember.getStaff_email());
            preparedStatement.setInt(6, staffMember.getStaff_id());

            // Execute the update statement
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Helper method to print SQL exceptions
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
