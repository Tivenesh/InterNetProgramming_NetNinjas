package com.tvpss.model;

public class User {
    private String username;
    private String password;
    private int role; // e.g., 1 for SUPER_ADMIN, 2 for ADMIN_PPD, etc.

    public User(String username, String password, int role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getRole() {
        return role;
    }
}
