package com.tvpss.service;

import com.tvpss.model.CrewApplication;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ApplicationService {

    private List<CrewApplication> applications = new ArrayList<>();

    // Constructor to populate some mock data
    public ApplicationService() {
        applications.add(new CrewApplication("21526", "1112030105123", "Chua Ern Qi", "Cameraman", 1, "Pending"));
        applications.add(new CrewApplication("21527", "1107110107890", "Denies Wong Ke Ying", "Newsreader", 1, "Pending"));
        applications.add(new CrewApplication("21528", "1005120102341", "Joyce Lee", "Cameraman", 2, "Pending"));
        applications.add(new CrewApplication("21529", "1008210103456", "Tan Theng Fang", "Newsreader", 2, "Pending"));
        applications.add(new CrewApplication("21530", "0912310105678", "Tang Zhi Yi", "Cameraman", 3, "Pending"));
    }

    // Get all applications
    public List<CrewApplication> getAllApplications() {
        return applications;
    }

    // Get an application by ID
    public CrewApplication getApplicationById(String id) {
        return applications.stream()
                .filter(application -> application.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    // Update application status
    public void updateApplicationStatus(String id, String status) {
    	CrewApplication application = getApplicationById(id);
        if (application != null) {
            application.setStatus(status);
        }
    }

    // Filter applications by search criteria
    public List<CrewApplication> searchApplications(String searchTerm) {
        return applications.stream()
                .filter(app -> app.getFullName().toLowerCase().contains(searchTerm.toLowerCase()) ||
                               app.getIcNumber().contains(searchTerm) ||
                               app.getPosition().toLowerCase().contains(searchTerm))
                .collect(Collectors.toList());
    }
}

