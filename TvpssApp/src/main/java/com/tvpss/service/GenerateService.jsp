package com.tvpss.service;

import com.tvpss.model.Achievement;
import com.tvpss.model.Certificate;

import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class GenerateService {
    private  List<Certificate> certificates = new ArrayList<>();
    private List<Achievement> achievements = new ArrayList<>();
    
    // Mock data for certificates
    public GenerateService() {
        certificates.add(new Certificate("SA1001", "SCH001", "SJK (C) Kuo Kuang 2", "Sport Achievement", "Single", "Pending"));
        certificates.add(new Certificate("MA1001", "SCH002", "SK Impian Emas", "Academic Achievement", "Multiple", "Generated"));
        certificates.add(new Certificate("MA1002", "SCH003", "SK Taman Universiti", "Sport Achievememt", "Single", "Pending"));
        certificates.add(new Certificate("SA1002", "SCH004", "SK Mutiara Rini", "Singing Competition", "Multiple", "Generated"));
        certificates.add(new Certificate("SA1003", "SCH005", "SK Taman Sri Pulai", "Essay Competition", "Single", "Pending"));
    
    	achievements.add(new Achievement("SA1001", "070101145678", "Ahmad bin Abdullah", "MSSD JB Badminton", "Sport Achievement", "Badminton", "Champion", "Pending", "Single"));
    	achievements.add(new Achievement("MA1001", "International Olympiad Mathematical", "Academic Achievement", new File("documents/math.xslx"), new File("documents/support.pdf"), "Pending", "Multiple"));
    	achievements.add(new Achievement("MA1002", "MSSZ Athletic Tournament", "Sport Achievememt", new File("documents/sport.xslx"), new File("documents/support.pdf"), "Generated", "Multiple"));
    	achievements.add(new Achievement("SA1002", "050607034455", "Siti binti Ibrahim", "Singing Competition", "Cultural Achievement", "Old Folks", "Bronze", "Generated", "Single"));
    	achievements.add(new Achievement("SA1003", "984575757577", "Lim Jing Xuan", "Essay Competition", "Academic Achievement", "English Writing", "Champion", "Pending", "Single"));
    	
    }

    // Get all certificates
    public List<Certificate> getAllCertificates() {
        return certificates;
    }

    // Add a new certificate
    public void addCertificate(Certificate certificate) {
        certificates.add(certificate);
    }

    public Certificate findCertificateBySchoolCode(String schoolCode) {
        return certificates.stream()
                .filter(certificate -> certificate.getSchoolCode().equals(schoolCode))
                .findFirst()
                .orElse(null);
    }
    
    public Certificate getCertificateById(String certificateId) {
        return certificates.stream()
                .filter(certificate -> certificate.getCertificateId().equals(certificateId))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Certificate not found"));
    }

    public Achievement getAchievementByCertificateId(String certificateId) {
        return achievements.stream()
                .filter(achievement -> achievement.getAchievementId().equals(certificateId))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Achievement not found for Certificate ID"));
    }
   
}
