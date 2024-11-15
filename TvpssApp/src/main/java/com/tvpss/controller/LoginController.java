package com.tvpss.controller;

import com.tvpss.model.User;
import com.tvpss.model.UserRoles;
import com.tvpss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("role") // Persist the role in the session
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // Display login.jsp
    }

    @PostMapping("/login")
    public ModelAndView processLogin(@RequestParam("username") String username,
                                     @RequestParam("password") String password,
                                     Model model) {
        User user = userService.findByUsernameAndPassword(username, password);

        if (user != null) {
            // Save user role to pass to the view (optional if using session)
            model.addAttribute("role", user.getRole());
            // Redirect to a common dashboard handler based on role
            return new ModelAndView("redirect:/dashboard");
        } else {
            // Login failed
            return new ModelAndView("login", "error", "Invalid username or password.");
        }
    }

    @GetMapping("/dashboard")
    public String showDashboard(@SessionAttribute("role") Integer role, Model model) {
        // Redirect to the specific dashboard based on role
        if (role != null) {
            switch (role) {
                case UserRoles.SUPER_ADMIN:
                    return "superadmin/dashboard";
                case UserRoles.ADMIN_PPD:
                    return "adminppd/dashboard";
                case UserRoles.ADMIN_STATE:
                    return "adminstate/dashboard";
                case UserRoles.ADMIN_SCHOOL:
                    return "adminschool/dashboard";
                case UserRoles.STUDENT:
                    return "student/dashboard";
                default:
                    model.addAttribute("error", "Role not recognized.");
                    return "login";
            }
        }
        model.addAttribute("error", "Access Denied.");
        return "login";
    }
}