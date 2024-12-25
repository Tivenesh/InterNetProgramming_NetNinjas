package com.tvpss.service;

import com.tvpss.model.CrewApplication;
import com.tvpss.repository.CrewApplicationDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

@Service
public class ApplicationService {

    @Autowired
    private CrewApplicationDao applicationDao;

    @PostConstruct
    @Transactional
    public void initializeApplications() {
        if(applicationDao.getAll().isEmpty()) {
            applicationDao.save(new CrewApplication(null, "1112030105123", "Chua Ern Qi", "Cameraman", 1, "Pending"));
            applicationDao.save(new CrewApplication(null, "1107110107890", "Denies Wong Ke Ying", "Newsreader", 1, "Pending"));
            applicationDao.save(new CrewApplication(null, "1005120102341", "Joyce Lee", "Cameraman", 2, "Pending"));
            applicationDao.save(new CrewApplication(null, "1008210103456", "Tan Theng Fang", "Newsreader", 2, "Pending"));
            applicationDao.save(new CrewApplication(null, "1109210104567", "Lim En Ting", "Newsreader", 2, "Pending"));
            applicationDao.save(new CrewApplication(null, "0912310105678", "Tang Zhi Yi", "Cameraman", 3, "Pending"));
        }
    }

    // Get all applications
    @Transactional
    public List<CrewApplication> getAllApplications() {
        return applicationDao.getAll();
    }

    // Get an application by ID
    @Transactional
    public CrewApplication getApplicationById(String id) {
        return applicationDao.getById(id);
    }

    // Update application status
    @Transactional
    public void updateApplicationStatus(String id, String status) {
    	CrewApplication application = applicationDao.getById(id);
        if (application != null) {
            application.setStatus(status);
            applicationDao.save(application);
        }
    }

    // Filter applications by search criteria
    @Transactional
    public List<CrewApplication> searchApplications(String searchTerm) {
        List<CrewApplication> allApplications = applicationDao.getAll();
        return allApplications.stream()
                .filter(app -> app.getFullName().toLowerCase().contains(searchTerm.toLowerCase()) ||
                               app.getIcNumber().contains(searchTerm) ||
                               app.getPosition().toLowerCase().contains(searchTerm))
                .collect(Collectors.toList());
    }

    // Save new application to database
    @Transactional
    public void addApplication(CrewApplication application) {
        applicationDao.save(application);
    }
}

