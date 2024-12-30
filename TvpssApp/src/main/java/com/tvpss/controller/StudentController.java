package com.tvpss.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tvpss.model.CrewApplication;
import com.tvpss.model.User;
import com.tvpss.service.ApplicationService;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private ApplicationService applicationService;
    
    @GetMapping("/dashboard")
    public String dashboard() {

        return "student/dashboard";
    }

    @GetMapping("/application")
    public String showApplicationPage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            CrewApplication application = applicationService.getApplicationByEmail(loggedInUser.getEmail());
            System.out.println("Application: " + application);

            if(application != null) {
                model.addAttribute("application", application);
                model.addAttribute("isApplicationSubmitted", true);
            }
        }
        
        return "student/application";
    }
    

    @PostMapping("/submitApplication")
    public String submitApplication(@RequestParam("studentIC") String icNumber,
                                    @RequestParam("studentName") String fullName,
                                    @RequestParam("studentEmail") String email,
                                    @RequestParam("studentForm") int form,
                                    @RequestParam("state") String state,
                                    @RequestParam("region") String region,
                                    @RequestParam("schoolName") String schoolName,
                                    @RequestParam("position") String position,
                                    HttpSession session) {
        CrewApplication existingApplication = applicationService.getApplicationByEmail(email);
        if(existingApplication != null) {
            return "redirect:/student/applicationResult?id=" + existingApplication.getId();
        }
        CrewApplication application = new CrewApplication();
        application.setIcNumber(icNumber);
        application.setFullName(fullName);
        application.setEmail(email);
        application.setState(state);
        application.setRegion(region);
        application.setSchoolName(schoolName);
        application.setPosition(position);
        application.setForm(form);
        application.setStatus("In Progress");

        System.out.println("IC Number: " + icNumber);
        System.out.println("Full Name: " + fullName);

        applicationService.addApplication(application);
        return "redirect:/student/applicationResult?id=" + application.getId(); // Redirect to the applicationResult page
    }


    @GetMapping("/applicationResult")
    public String showApplicationResult(Model model, @RequestParam(value = "applicationId", required = false) Long applicationId) {
        if (applicationId == null) {
            model.addAttribute("error", "Application ID is missing.");
            return "student/dashboard";  // Redirect to dashboard or error page
        }
        CrewApplication application = applicationService.getApplicationById(applicationId);
        if (application == null) {
            model.addAttribute("error", "Application not found.");
            return "student/dashboard";  // Redirect to dashboard or error page
            
        }
        model.addAttribute("application", application);
        return "student/applicationResult";  
    }

    
    

   
}
