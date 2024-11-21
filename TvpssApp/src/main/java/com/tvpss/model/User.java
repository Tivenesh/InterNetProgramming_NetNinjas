package com.tvpss.model;

public class User {
    private String username;
    private String password;
    private int role; // e.g., 1 for SUPER_ADMIN, 2 for ADMIN_PPD, etc.
    private String state; 
    private String email;

    public User(String username, String password, int role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    // Add a new constructor
    public User(String username, String password, int role, String state, String email) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.state = state;
        this.email = email;
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

     public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getState() { // Add getter
        return state;
    }

    public void setState(String state) { // Add setter
        this.state = state;
    }

    public String getEmail() { // Add getter for email
        return email;
    }

    public void setEmail(String email) { // Add setter for email
        this.email = email;
    }
    
    public String getUserRoleName() {
        switch (this.role) {
            case 1:
                return "Super Admin";
            case 2:
                return "PPD Admin";
            case 3:
                return "State Admin";
            case 4:
                return "School Admin";
            case 5:
                return "Student";
            default:
                return "Unknown Role";
        }
    }
}

