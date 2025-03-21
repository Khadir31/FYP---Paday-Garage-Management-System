/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Order {
    private int orderId;
    private int userId;
    private byte[] image;
    private String status;
    private double totalPrice; // New field for totalPrice

    public Order(int orderId, int userId, byte[] image, String status, double totalPrice) {
        this.orderId = orderId;
        this.userId = userId;
        this.image = image;
        this.status = status;
        this.totalPrice = totalPrice;
    }

    public Order(int userId, byte[] image, String status, double totalPrice) {
        this.userId = userId;
        this.image = image;
        this.status = status;
        this.totalPrice = totalPrice;
    }

    public Order() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    
}

