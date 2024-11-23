package com.tvpss.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import com.tvpss.model.School;

@Service
public class SchoolService {
    private School school = new School(); // In-memory storage for a single school
    private List<School> schoolDatabase = new ArrayList<>();
    
    public School getSchool() {
        return school;
    }

    public void saveSchool(School updatedSchool) {
        this.school = updatedSchool; // Updates the in-memory "current school"
        schoolDatabase.add(updatedSchool); // Simulates saving to a database
    }

    public List<School> getAllSchools() {
        return schoolDatabase; // Retrieve all saved schools
    }

}