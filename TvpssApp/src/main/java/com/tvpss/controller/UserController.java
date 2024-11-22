package com.tvpss.controller;

import com.tvpss.model.User;
import com.tvpss.service.UserService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // View all users (manage users page)
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

    // Show Add User Form
    @GetMapping("/addUser")
    public String showAddUserForm() {
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
                          RedirectAttributes redirectAttributes,
                          Model model) {
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            model.addAttribute("username", username);
            model.addAttribute("email", email);
            model.addAttribute("role", role);
            model.addAttribute("state", state);
            return "superadmin/addUser"; // Return to the form with error and data
        }

        userService.addUser(username, email, role, state, password);
        redirectAttributes.addFlashAttribute("success", "New user was successfully added.");
        return "redirect:/manageUsers?success=true"; // Redirect to Manage Users page
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
                             @RequestParam("email") String email,
                             @RequestParam("role") int role,
                             @RequestParam("state") String state,
                             RedirectAttributes redirectAttributes) {
    	userService.updateUser(username, email, role, state);
        redirectAttributes.addFlashAttribute("success", "User updated successfully.");
        return "redirect:/manageUsers?success=true";
    }

    // Delete a user
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("username") String username, RedirectAttributes redirectAttributes) {
        userService.deleteUser(username); // Delete the user via the service
        redirectAttributes.addFlashAttribute("success", "User deleted successfully!"); // Add a success message
        return "redirect:/manageUsers?success=true"; // Redirect to Manage Users with a query parameter
    }

}