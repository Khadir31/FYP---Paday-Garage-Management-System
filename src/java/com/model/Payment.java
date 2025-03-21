/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

import java.io.InputStream;
import java.math.BigDecimal;

/**
 *
 * @author Acer
 */
public class Payment {
    private int paymentId;
    private int userId;
    private BigDecimal totalPrice;
    private InputStream image;
    private String status;

    public Payment(int paymentId, int userId, BigDecimal totalPrice, InputStream image, String status) {
        this.paymentId = paymentId;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.image = image;
        this.status = status;
    }

    public Payment(int userId, BigDecimal totalPrice, InputStream image, String status) {
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.image = image;
        this.status = status;
    }

    public Payment() {
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public InputStream getImage() {
        return image;
    }

    public void setImage(InputStream image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    
}
