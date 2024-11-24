package com.tvpss.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tvpss.model.CrewApplication;
import com.tvpss.model.School;
import com.tvpss.service.ApplicationService;
import com.tvpss.service.SchoolService;


@Controller
@RequestMapping("/adminschool") // Base path for admin school routes
@SessionAttributes("school")
public class SchoolAdminController {
	
	@Autowired
	private SchoolService schoolService;
	
	@Autowired
    private ApplicationService applicationService;
	
	 private static final String UPLOAD_DIRECTORY = "src/main/webapp/resources/static/uploads/school-logos";
	 
	@ModelAttribute("school")
    public School school() {
        return schoolService.getSchool();
    }

	
    @GetMapping("/dashboard")
    public String showAdminSchoolDashboard(Model model) {
        model.addAttribute("page", "dashboard");
        model.addAttribute("pageTitle", "Welcome Admin School!");
        model.addAttribute("numStudents", 500);
        model.addAttribute("totalAchievements", 120);
        model.addAttribute("numCrew", 20);

        // Chart data
        model.addAttribute("chartLabels", "['21 Nov', '22 Nov', '23 Nov', '24 Nov', '25 Nov', '26 Nov', '27 Nov']");
        model.addAttribute("chartData", "[40, 30, 50, 40, 20, 30, 25]");
        model.addAttribute("genderMale", 70);
        model.addAttribute("genderFemale", 30);

        return "adminschool/dashboard"; // Maps to WEB-INF/views/adminschool/dashboard.jsp
    }
    
    @GetMapping("/school-information")
    public String showSchoolInformation(HttpSession session, Model model) {
    	School school = (School) session.getAttribute("school");

        // Add the retrieved object to the model
        model.addAttribute("school", school);
        model.addAttribute("pageTitle", "School Information");
        model.addAttribute("page", "school-information");
        return "adminschool/school-information";
    }

    @PostMapping("/save-school-information")
    public String saveSchoolInformation(
            @ModelAttribute("school") School school,
            RedirectAttributes redirectAttributes) {

        try {
            MultipartFile logo = school.getLogo(); // Get the uploaded file

            if (logo != null && !logo.isEmpty()) {
                // Create upload directory if it does not exist
                Path uploadPath = Paths.get("src/main/webapp/resources/static/uploads/school-logos");
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                // Generate unique filename
                String originalFilename = logo.getOriginalFilename();
                String newFilename = System.currentTimeMillis() + "_" + originalFilename;

                // Save file to the upload directory
                Path filePath = uploadPath.resolve(newFilename);
                Files.copy(logo.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                // Update the school object to store the filename (optional)
                // This assumes you want to save the filename for later retrieval
                school.setLogoFilename(newFilename); // Add a new String field for filename in School class
            }

            // Save the School object
            schoolService.saveSchool(school);

            // Add success message
            redirectAttributes.addFlashAttribute("successMessage", "School information saved successfully!");
            return "redirect:/adminschool/viewSchoolInformation";

        } catch (IOException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to upload logo: " + e.getMessage());
            return "redirect:/adminschool/school-information";
        }
    }



    @GetMapping("/viewSchoolInformation")
    public String viewSchoolInformation(HttpSession session, Model model) {
    	School school = (School) session.getAttribute("school");
    	
    	if (school == null) {
    		System.out.println("School object is null, redirecting to form."); // Debug log
    		return "redirect:/adminschool/school-information";
        }

        model.addAttribute("school", school);
        model.addAttribute("page", "school-information");
        model.addAttribute("pageTitle", "School Information");
        return "adminschool/viewSchoolInformation";
    }

    @GetMapping("/saveSchoolDB")
    public String saveToDatabase(HttpSession session, RedirectAttributes redirectAttributes) {
        School school = (School) session.getAttribute("school");
            schoolService.saveSchool(school); // Save to in-memory database or actual DB
            redirectAttributes.addFlashAttribute("message", "School details saved successfully.");
            return "redirect:/adminschool/school-information";
       
    }
    
    @GetMapping("/crew-application")
    public String getCrewApplications(Model model) {
        List<CrewApplication> applications = applicationService.getAllApplications();
        model.addAttribute("page","crew-application");
        model.addAttribute("pageTitle", "Crew Application");
        model.addAttribute("applications", applications);
        return "adminschool/crew-application";
    }
    
 // View details of a specific application
    @GetMapping("/view/{id}")
    public String viewApplication(@PathVariable String id, Model model) {
        CrewApplication application = applicationService.getApplicationById(id);
        if (application == null) {
            model.addAttribute("errorMessage", "Application not found!");
            return "error";
        }
        model.addAttribute("application", application);
        return "adminschool/viewApplication";
    }

    @PostMapping("/updateStatus")
    public String updateApplicationStatus(
            @RequestParam("applicationIds") List<String> applicationIds,
            @RequestParam("status") String status,
            RedirectAttributes redirectAttributes) {

        // Update the status for each selected application
        for (String applicationId : applicationIds) {
            applicationService.updateApplicationStatus(applicationId, status);
        }

        redirectAttributes.addFlashAttribute("message", "Applications have been updated successfully!");
        return "redirect:/adminschool/crew-application";
    }

    // Search for applications
    @GetMapping("/searchApplication")
    public String searchApplications(@RequestParam String search, Model model) {
        List<CrewApplication> results = applicationService.searchApplications(search);
        model.addAttribute("applications", results);
        return "crew-application";
    }

    
}

