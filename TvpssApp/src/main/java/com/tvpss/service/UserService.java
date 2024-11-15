package com.tvpss.service;

import com.tvpss.model.User;
import com.tvpss.model.UserRoles;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

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

    public User findByUsernameAndPassword(String username, String password) {
        User user = users.get(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null; // Return null if credentials don't match
    }
}