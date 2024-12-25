package com.tvpss.controller;

import java.io.IOException;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

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

import com.tvpss.model.Achievement;
import com.tvpss.model.CrewApplication;
import com.tvpss.model.School;
import com.tvpss.service.AchievementService;
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

    @Autowired
    private AchievementService achievementService;

    private static final String UPLOAD_DIRECTORY = "src/main/webapp/resources/static/uploads/school-logos";

    @ModelAttribute("school")
    public School school() {
        return new School();
    }

    // School Information and Dashboard Management

    @GetMapping("/dashboard")
    public String showAdminSchoolDashboard(Model model) {
        model.addAttribute("page", "dashboard");
        model.addAttribute("pageTitle", "Welcome Admin School!");
        model.addAttribute("numStudents", 500);
        model.addAttribute("totalAchievements", achievementService.getAllAchievements().size());
        model.addAttribute("numCrew", applicationService.getAllApplications().size());

        // Chart data
        model.addAttribute("chartLabels", "['21 Nov', '22 Nov', '23 Nov', '24 Nov', '25 Nov', '26 Nov', '27 Nov']");
        model.addAttribute("chartData", "[40, 30, 50, 40, 20, 30, 25]");
        model.addAttribute("genderMale", 70);
        model.addAttribute("genderFemale", 30);

        return "adminschool/dashboard"; // Maps to WEB-INF/views/adminschool/dashboard.jsp
    }

    @GetMapping("/school-information")
    public String showSchoolInformation(HttpSession session, Model model) {
        School school = schoolService.getSchool();

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
            MultipartFile logo = school.getLogo();

            if (logo != null && !logo.isEmpty()) {
                Path uploadPath = Paths.get(UPLOAD_DIRECTORY);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                String originalFilename = logo.getOriginalFilename();
                String newFilename = System.currentTimeMillis() + "_" + originalFilename;

                Path filePath = uploadPath.resolve(newFilename);
                Files.copy(logo.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                school.setLogoFilename(newFilename);
            }

            schoolService.saveSchool(school);
            redirectAttributes.addFlashAttribute("successMessage", "School information saved successfully!");
            return "redirect:/adminschool/viewSchoolInformation";

        } catch (IOException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to upload logo: " + e.getMessage());
            return "redirect:/adminschool/school-information";
        }
    }

    @GetMapping("/viewSchoolInformation")
    public String viewSchoolInformation(Model model) {
        School school = schoolService.getSchool();
        model.addAttribute("school", school);
        model.addAttribute("page", "school-information");
        model.addAttribute("pageTitle", "School Information");
        return "adminschool/viewSchoolInformation";
    }

    @GetMapping("/saveSchoolDB")
    public String saveToDatabase(HttpSession session, RedirectAttributes redirectAttributes) {
        School school = (School) session.getAttribute("school");
        schoolService.saveSchool(school);
        redirectAttributes.addFlashAttribute("message", "School details saved successfully.");
        return "redirect:/adminschool/school-information";
    }

 // Achievement Management

    @GetMapping("/student-achievement")
    public String viewAchievements(Model model) {
        List<Achievement> achievements = achievementService.getAllAchievements();
        model.addAttribute("achievements", achievements);
        model.addAttribute("page", "student-achievement");
        model.addAttribute("pageTitle", "Student Achievements");
        return "adminschool/student-achievement";
    }

    @GetMapping("/submit-achievement")
    public String showSubmitAchievementForm(Model model) {
        model.addAttribute("achievement", new Achievement());
        return "adminschool/submit-achievement";
    }
    
    @PostMapping("/submit-achievement")
    public String handleAchievementSubmission(
            @RequestParam("formMode") String formMode,
            @RequestParam(value = "icNumber", required = false) String icNumber,
            @RequestParam(value = "fullName", required = false) String fullName,
            @RequestParam("activityName") String activityName,
            @RequestParam("category") String category,
            @RequestParam(value = "subCategory", required = false) String subCategory,
            @RequestParam(value = "awardInfo", required = false) String awardInfo,
            @RequestParam(value = "uploadDoc", required = false) MultipartFile uploadDoc,
            @RequestParam(value = "supportDoc", required = false) MultipartFile[] supportDoc,
            RedirectAttributes redirectAttributes,
            HttpServletRequest request) {

        try {
            if ("single".equalsIgnoreCase(formMode)) {
                Achievement singleAchievement = new Achievement();
                singleAchievement.setAchievementId(generateUniqueId());
                singleAchievement.setIcNumber(icNumber);
                singleAchievement.setFullName(fullName);
                singleAchievement.setActivityName(activityName);
                singleAchievement.setCategory(category);
                singleAchievement.setSubCategory(subCategory);
                singleAchievement.setAwardInfo(awardInfo);
                singleAchievement.setFormMode("Single");
                singleAchievement.setStatus("Pending");
                achievementService.saveAchievement(singleAchievement);

            } else if ("multiple".equalsIgnoreCase(formMode)) {
                Achievement multipleAchievement = new Achievement();
                multipleAchievement.setAchievementId(generateUniqueId());
                multipleAchievement.setActivityName(activityName);
                multipleAchievement.setCategory(category);
                multipleAchievement.setFormMode("Multiple");
                multipleAchievement.setStatus("Pending");

                if (uploadDoc != null && !uploadDoc.isEmpty()) {
                    File savedCsvFile = saveUploadedFile(uploadDoc, request);
                    multipleAchievement.setUploadDocPath(savedCsvFile);
                }

                if (supportDoc != null) {
                    for (MultipartFile file : supportDoc) {
                        if (!file.isEmpty()) {
                            saveUploadedFile(file, request);
                        }
                    }
                }

                achievementService.saveAchievement(multipleAchievement);
            }
        } catch (IOException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "File upload failed: " + e.getMessage());
            return "redirect:/adminschool/submit-achievement";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while processing the request: " + e.getMessage());
            return "redirect:/adminschool/submit-achievement";
        }

        return "redirect:/adminschool/student-achievement";
    }

    private String generateUniqueId() {
        return "ACH" + System.currentTimeMillis();
    }

    private File saveUploadedFile(MultipartFile file, HttpServletRequest request) throws IOException {
        String uploadDir = request.getServletContext().getRealPath("/resources/uploads");
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }
        File uploadedFile = new File(uploadDir, file.getOriginalFilename());
        file.transferTo(uploadedFile);
        return uploadedFile;
    }
    
    @PostMapping("/add-achievement")
    public String saveAchievementApplication(
            @ModelAttribute("achievement") Achievement achievements,
            RedirectAttributes redirectAttributes) {

    	achievementService.saveAchievement(achievements);
            redirectAttributes.addFlashAttribute("successMessage", "School information saved successfully!");
            return "redirect:/adminschool/student-achievement";

    }
    
    // Crew Application Management

    @GetMapping("/crew-application")
    public String getCrewApplications(Model model) {
        List<CrewApplication> applications = applicationService.getAllApplications();
        model.addAttribute("page", "crew-application");
        model.addAttribute("pageTitle", "Crew Application");
        model.addAttribute("applications", applications);
        return "adminschool/crew-application";
    }

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

        for (String applicationId : applicationIds) {
            applicationService.updateApplicationStatus(applicationId, status);
        }

        redirectAttributes.addFlashAttribute("message", "Applications have been updated successfully!");
        return "redirect:/adminschool/crew-application";
    }

    @GetMapping("/searchApplication")
    public String searchApplications(@RequestParam String search, Model model) {
        List<CrewApplication> results = applicationService.searchApplications(search);
        model.addAttribute("applications", results);
        return "adminschool/crew-application";
    }
}
