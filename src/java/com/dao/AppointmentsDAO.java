/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.model.appointments;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentsDAO {
    // Database connection details
    private String jdbcURL = "jdbc:mysql://localhost:3306/pgms";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    // SQL queries
    private static final String INSERT_APPOINTMENT_SQL = "INSERT INTO appointments (userId, name, carModel, appointmentDate, appointmentTime, status) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_APPOINTMENTS_BY_USER_ID = "SELECT * FROM appointments WHERE userId = ?";
    private static final String UPDATE_APPOINTMENT_STATUS_SQL = "UPDATE appointments SET status = ? WHERE appointmentId = ?";
    private static final String SELECT_APPOINTMENT_BY_ID_SQL = "SELECT * FROM appointments WHERE appointmentId = ?";
    private static final String SELECT_ALL_APPOINTMENTS_SQL = "SELECT * FROM appointments"; // Added SQL query to select all appointments

    // Constructor
    public AppointmentsDAO() {}

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

    // Method to insert a new appointment into the database
    public void insertAppointment(appointments appointment) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_APPOINTMENT_SQL)) {
            preparedStatement.setInt(1, appointment.getUserId());
            preparedStatement.setString(2, appointment.getName());
            preparedStatement.setString(3, appointment.getCarModel());
            preparedStatement.setString(4, appointment.getAppointmentDate());
            preparedStatement.setString(5, appointment.getAppointmentTime());
            preparedStatement.setString(6, appointment.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Method to retrieve all appointments for a given user ID from the database
    public List<appointments> selectAllAppointmentsByUserId(int userId) {
        List<appointments> appointmentsList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_APPOINTMENTS_BY_USER_ID)) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int appointmentId = rs.getInt("appointmentId");
                int userIdFromDb = rs.getInt("userId");
                String name = rs.getString("name");
                String carModel = rs.getString("carModel");
                String appointmentDate = rs.getString("appointmentDate");
                String appointmentTime = rs.getString("appointmentTime");
                String status = rs.getString("status");
                appointmentsList.add(new appointments(appointmentId, userIdFromDb, name, carModel, appointmentDate, appointmentTime, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return appointmentsList;
    }

    // Method to retrieve all appointments from the database
    public List<appointments> selectAllAppointments() {
        List<appointments> appointmentsList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_APPOINTMENTS_SQL)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                // Retrieve appointment details from ResultSet and add to appointmentsList
                int appointmentId = rs.getInt("appointmentId");
                int userIdFromDb = rs.getInt("userId");
                String name = rs.getString("name");
                String carModel = rs.getString("carModel");
                String appointmentDate = rs.getString("appointmentDate");
                String appointmentTime = rs.getString("appointmentTime");
                String status = rs.getString("status");
                appointmentsList.add(new appointments(appointmentId, userIdFromDb, name, carModel, appointmentDate, appointmentTime, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return appointmentsList;
    }

    // Method to update the status of an appointment in the database
    public boolean updateAppointmentStatus(int appointmentId, String status) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_APPOINTMENT_STATUS_SQL)) {
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, appointmentId);
            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    // Method to retrieve an appointment by its ID from the database
    public appointments selectAppointmentById(int appointmentId) {
        appointments appointment = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_APPOINTMENT_BY_ID_SQL)) {
            preparedStatement.setInt(1, appointmentId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int userIdFromDb = rs.getInt("userId");
                String name = rs.getString("name");
                String carModel = rs.getString("carModel");
                String appointmentDate = rs.getString("appointmentDate");
                String appointmentTime = rs.getString("appointmentTime");
                String status = rs.getString("status");
                appointment = new appointments(appointmentId, userIdFromDb, name, carModel, appointmentDate, appointmentTime, status);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return appointment;
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


