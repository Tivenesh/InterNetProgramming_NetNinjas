package com.tvpss.controller;

import com.tvpss.model.User;
import com.tvpss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // View all users (manage users page)
    @GetMapping("/manageUsers")
    public String manageUsers(Model model) {
        model.addAttribute("users", userService.findAllUsers()); // Add the users to the model
        return "superadmin/manageUsers"; // Return the view to display users
    }

    // Add a new user
    @PostMapping("/addUser")
    public String addUser(@RequestParam("username") String username,
                          @RequestParam("password") String password,
                          @RequestParam("role") int role,
                          Model model) {
        userService.addUser(username, password, role); // Add the user via the service
        model.addAttribute("message", "User added successfully!");
        return "redirect:/message"; // Redirect to message page
    }

    // Show edit user form
    @GetMapping("/editUser")
    public String editUser(@RequestParam("username") String username, Model model) {
        User user = userService.findAllUsers().stream()
                               .filter(u -> u.getUsername().equals(username))
                               .findFirst()
                               .orElse(null);
        model.addAttribute("user", user); // Add the user to the model for editing
        return "superadmin/editUser"; // Return the view for editing
    }

    // Update user
    @PostMapping("/updateUser")
    public String updateUser(@RequestParam("username") String username,
                             @RequestParam("password") String password,
                             @RequestParam("role") int role) {
        userService.updateUser(username, password, role); // Update the user
        return "redirect:/manageUsers"; // Redirect back to the user table
    }


    // Delete a user
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("username") String username, Model model) {
        userService.deleteUser(username); // Delete the user via the service
        model.addAttribute("message", "User deleted successfully!");
        return "redirect:/message"; // Redirect to message page
    }

    // Show message after actions
    @GetMapping("/message")
    public String showMessage(Model model) {
        return "superadmin/message"; // Show message page
    }
}
