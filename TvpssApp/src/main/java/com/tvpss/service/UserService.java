package com.tvpss.service;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tvpss.model.User;
import com.tvpss.model.UserRoles;
import com.tvpss.repository.UserDao;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @PostConstruct
    @Transactional
    public void initializeUsers() {
        if(userDao.findAllUsers().isEmpty()) {
            userDao.save(new User("superadmin", "super123", UserRoles.SUPER_ADMIN, "Selangor", "superadmin@tvpss.com"));
            userDao.save(new User("adminppd", "ppd123", UserRoles.ADMIN_PPD, "Johor", "adminppd@tvpss.com"));
            userDao.save(new User("adminstate", "state123", UserRoles.ADMIN_STATE, "Melaka", "adminstate@tvpss.com"));
            userDao.save(new User("adminschool", "school123", UserRoles.ADMIN_SCHOOL, "Kedah", "adminschool@tvpss.com"));
            userDao.save(new User("student", "student123", UserRoles.STUDENT, "Penang", "student@tvpss.com"));
        }
    }
   
    @Transactional
    public long getUserCountByRole(int role) {
        return userDao.countUsersByRole(role);
    }
    
    @Transactional
    public User findByUsernameAndPassword(String username, String password) {
        User user = userDao.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null; // Return null if credentials don't match
    }

    @Transactional
    public List<User> findAllUsers() {
        return userDao.findAllUsers();
    }
    
    @Transactional
    public boolean isUsernameExists(String username) {
        User user = userDao.findByUsername(username);
        return user != null;  // Returns true if the user already exists.
    }

    @Transactional
    public void addUser(String username, String email, int role, String state, String password) {
        User user = userDao.findByUsername(username);
        if (user != null) {
            throw new RuntimeException("Username already exists");
        }
        user = new User(username, password, role, state, email);
        userDao.save(user);
    }


    @Transactional
    public void updateUser(String username, String email, int role, String state) {
        User user = userDao.findByUsername(username);
        if (user != null) {
            user.setEmail(email);
            user.setRole(role);
            user.setState(state);
            userDao.save(user);  // Save after updating
        }
    }

    @Transactional
    public void deleteUser(String username) {
        userDao.deleteByUsername(username);
    }
}