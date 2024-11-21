package com.tvpss.controller;

import com.tvpss.model.User;
import com.tvpss.service.UserService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/manageUsers")
    public String manageUsers(@RequestParam(defaultValue = "1") int page, Model model) {
        int pageSize = 6; // Number of users per page
        List<User> allUsers = userService.findAllUsers();
        int totalUsers = allUsers.size();
        int totalPages = (int) Math.ceil((double) totalUsers / pageSize);

        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalUsers);
        List<User> usersOnPage = allUsers.subList(startIndex, endIndex);

        model.addAttribute("users", usersOnPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "superadmin/manageUsers";
    }

    @GetMapping("/addUser")
    public String addUser(@RequestParam("username") String username, Model model) {
        User user = userService.findAllUsers().stream()
                               .filter(u -> u.getUsername().equals(username))
                               .findFirst()
                               .orElse(null);
        model.addAttribute("user", user);
        return "superadmin/addUser"; 
    }
    
    // Add a new user
    @PostMapping("/addUser")
    public String addUser(@RequestParam("username") String username,
                          @RequestParam("email") String email,
                          @RequestParam("role") int role,
                          @RequestParam("state") String state,
                          @RequestParam("password") String password,
                          @RequestParam("confirmPassword") String confirmPassword,
                          Model model) {
        // Validate if passwords match
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            return "superadmin/addUser";
        }

        userService.addUser(username, email, role, state, password);
        return "redirect:/manageUsers";
    }

    // Show edit user form
    @GetMapping("/editUser")
    public String editUser(@RequestParam("username") String username, Model model) {
        User user = userService.findAllUsers().stream()
                               .filter(u -> u.getUsername().equals(username))
                               .findFirst()
                               .orElse(null);
        model.addAttribute("user", user);
        return "superadmin/editUser";
    }

    // Update user
    @PostMapping("/updateUser")
    public String updateUser(@RequestParam("username") String username,
                             @RequestParam("password") String password,
                             @RequestParam("role") int role,
                             @RequestParam("state") String state,
                             @RequestParam("email") String email) {
        userService.updateUser(username, password, role, state, email);
        return "redirect:/manageUsers";
    }

    // Delete a user
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("username") String username, Model model) {
        userService.deleteUser(username);
        model.addAttribute("message", "User deleted successfully!");
        return "redirect:/message";
    }

    @GetMapping("/message")
    public String showMessage(Model model) {
        return "superadmin/message";
    }
}
