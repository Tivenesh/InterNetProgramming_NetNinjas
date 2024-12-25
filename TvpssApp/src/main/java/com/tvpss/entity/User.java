package com.tvpss.entity;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {

    @Id
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "role", nullable = false)
    private int role;

    @Column(name = "state")
    private String state;

    @Column(name = "email")
    private String email;

    // Default constructor (required by Hibernate)
    public User() {}

    // Custom constructor for convenience
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

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
