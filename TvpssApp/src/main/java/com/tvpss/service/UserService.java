package com.tvpss.service;

import com.tvpss.model.User;
import com.tvpss.model.UserRoles;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class UserService {

    // In-memory user data (replace with database in a real application)
    private static final Map<String, User> users = new HashMap<>();

    static {
        users.put("superadmin", new User("superadmin", "super123", UserRoles.SUPER_ADMIN));
        users.put("adminppd", new User("adminppd", "ppd123", UserRoles.ADMIN_PPD));
        users.put("adminstate", new User("adminstate", "state123", UserRoles.ADMIN_STATE));
        users.put("adminschool", new User("adminschool", "school123", UserRoles.ADMIN_SCHOOL));
        users.put("student", new User("student", "student123", UserRoles.STUDENT));
    }

    // // For superAdmin
    // static {
    //     users.put("superadmin", new User("superadmin", "super123", UserRoles.SUPER_ADMIN, "Selangor", "superadmin@tvpss.com"));
    //     users.put("adminppd", new User("adminppd", "ppd123", UserRoles.ADMIN_PPD, "Johor", "adminppd@tvpss.com"));
    //     users.put("adminstate", new User("adminstate", "state123", UserRoles.ADMIN_STATE, "Melaka", "adminstate@tvpss.com"));
    //     users.put("adminschool", new User("adminschool", "school123", UserRoles.ADMIN_SCHOOL, "Kedah", "adminschool@tvpss.com"));
    //     users.put("student", new User("student", "student123", UserRoles.STUDENT, "Penang", "student@tvpss.com"));
    // }

    public User findByUsernameAndPassword(String username, String password) {
        User user = users.get(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null; // Return null if credentials don't match
    }
    public List<User> findAllUsers() {
        return users.values().stream().collect(Collectors.toList());
    }
    
    public void addUser(String username, String email, int role, String state, String password) {
        users.put(username, new User(username, password, role, state, email));
    }
    
    public void updateUser(String username, String email, int role, String state) {
        User user = users.get(username);
        if (user != null) {
            user.setEmail(email);
            user.setRole(role);
            user.setState(state);
           
        }
    }

    public void deleteUser(String username) {
        users.remove(username);
    }
}