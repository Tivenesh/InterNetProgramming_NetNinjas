package com.tvpss.service;

import com.tvpss.model.Achievement;
import com.tvpss.model.Certificate;
import com.tvpss.repository.AchievementDao;
import com.tvpss.repository.CertificateDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

@Service
public class CertificateService {
   
    @Autowired
    private CertificateDao certificateDao;

    @Autowired
    private AchievementDao achievementDao;

    @PostConstruct
    @Transactional
    public void initializeCertificates() {
        if(certificateDao.getAllCertificates().isEmpty()) {
            certificateDao.save(new Certificate("SA1001", "SCH001", "SJK (C) Kuo Kuang 2", "Sport Achievement", "Single", "Pending"));
            certificateDao.save(new Certificate("MA1001", "SCH002", "SK Impian Emas", "Academic Achievement", "Multiple", "Generated"));
            certificateDao.save(new Certificate("MA1002", "SCH003", "SK Taman Universiti", "Sport Achievememt", "Single", "Pending"));
            certificateDao.save(new Certificate("SA1002", "SCH004", "SK Mutiara Rini", "Singing Competition", "Multiple", "Generated"));
            certificateDao.save(new Certificate("SA1003", "SCH005", "SK Taman Sri Pulai", "Essay Competition", "Single", "Pending"));
        }
    }
    
    @Transactional
    // Get all certificates
    public List<Certificate> getAllCertificates() {
        return certificateDao.getAllCertificates();
    }

    // Add a new certificate
    @Transactional
    public void addCertificate(Certificate certificate) {
        certificateDao.save(certificate);
    }

    @Transactional
    public Certificate findCertificateBySchoolCode(String schoolCode) {
        return certificateDao.findBySchoolCode(schoolCode);
    }
    
    @Transactional
    public Certificate getCertificateById(String certificateId) {
        return certificateDao.findById(certificateId)
        .orElseThrow(() -> new RuntimeException("Certificate not found for ID: " + certificateId));
    }

    @Transactional
    public Achievement getAchievementByCertificateId(String certificateId) {
        return achievementDao.findByAchievementId(certificateId)
                .orElseThrow(() -> new RuntimeException("Achievement not found for Certificate ID"));
    }
   
}
