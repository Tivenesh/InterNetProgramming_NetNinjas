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

    public School getSchoolBySchoolCode(String schoolCode) {
        // Simulates a database lookup
        for (School school : schoolDatabase) {
            if (school.getCode().equalsIgnoreCase(schoolCode)) {
                return school;
            }
        }
        return null; // Return null if not found
    }
    public SchoolService() {
        // Adding a test school for SCH001
        School testSchool = new School();
        testSchool.setCode("SCH001");
        testSchool.setName("TIVENESH SCHOOL");
        testSchool.setAddress1("23, JLN NB2 10/7, TAMAN NUSA BESTARI 2");
        testSchool.setAddress2("JOHOR BAHRU, JOHOR");
        testSchool.setPostcode("81300");
        testSchool.setState("JOHOR");
        testSchool.setTelephoneNumber("01126727701");
        testSchool.setEmail("tivensrinivasan@gmail.com");
        testSchool.setLogoFilename("testLogo.png"); // Assuming a test logo exists
        testSchool.setYoutubeLink("https://www.youtube.com/watch?v=25bb8H0MOEM");
        testSchool.setStudio("Yes");
        testSchool.setYoutubeUpload("Yes");
        testSchool.setRecordingInSchool("Yes");
        testSchool.setRecordingInOutSchool("No");
        testSchool.setTvpssLogo("Uploaded");
        schoolDatabase.add(testSchool);
    }

}