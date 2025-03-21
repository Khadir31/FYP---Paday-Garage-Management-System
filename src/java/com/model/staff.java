/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author Acer
 */
public class staff {
    private int staff_id;
    private String staff_name;
    private String staff_username;
    private String password;
    private String phone_number;
    private String staff_email;

    public staff(int staff_id, String staff_name, String staff_username, String password, String phone_number, String staff_email) {
        this.staff_id = staff_id;
        this.staff_name = staff_name;
        this.staff_username = staff_username;
        this.password = password;
        this.phone_number = phone_number;
        this.staff_email = staff_email;
    }

    public staff(String staff_name, String staff_username, String password, String phone_number, String staff_email) {
        this.staff_name = staff_name;
        this.staff_username = staff_username;
        this.password = password;
        this.phone_number = phone_number;
        this.staff_email = staff_email;
    }

    public staff() {
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public String getStaff_name() {
        return staff_name;
    }

    public void setStaff_name(String staff_name) {
        this.staff_name = staff_name;
    }

    public String getStaff_username() {
        return staff_username;
    }

    public void setStaff_username(String staff_username) {
        this.staff_username = staff_username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getStaff_email() {
        return staff_email;
    }

    public void setStaff_email(String staff_email) {
        this.staff_email = staff_email;
    }
    
    
}
