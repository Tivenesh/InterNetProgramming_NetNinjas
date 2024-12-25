package com.tvpss.service;

import com.tvpss.model.Achievement;
import com.tvpss.repository.AchievementDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

@Service
public class AchievementService {
	
	@Autowired
	private AchievementDao achievementDao;

	@PostConstruct
	@Transactional
	public void initializeAchievements() {
		if(achievementDao.getAllAchievements().isEmpty()) {
			achievementDao.save(new Achievement("SA1001", "070101145678", "Ahmad bin Abdullah", "MSSD JB Badminton", "Sport Achievement", "Badminton", "Champion", "Pending", "Single"));
            achievementDao.save(new Achievement("SA1002", "050607034455", "Siti binti Ibrahim", "Singing Competition", "Cultural Achievement", "Old Folks", "Bronze", "Generated", "Single"));
            achievementDao.save(new Achievement("SA1003", "984575757577", "Lim Jing Xuan", "Essay Competition", "Academic Achievement", "English Writing", "Champion", "Pending", "Single"));
            achievementDao.save(new Achievement("SA1004", "040303006056", "Joanne Lim", "Debate Competition", "Academic Achievement", "Malay Debate", "Runner-up", "Generated", "Single"));
            achievementDao.save(new Achievement("SA1005", "083456789012", "Law Shi Jing", "Kangaroo Math", "Academic Achievement", "Math", "Participation", "Pending", "Single"));

            // Multiple Achievements
            achievementDao.save(new Achievement("MA1001", "International Olympiad Mathematical", "Academic Achievement",
                    new File("documents/math.xslx"), new File("documents/support.pdf"), "Pending", "Multiple"));
            achievementDao.save(new Achievement("MA1002", "MSSZ Athletic Tournament", "Sport Achievement",
                    new File("documents/sport.xslx"), new File("documents/support.pdf"), "Generated", "Multiple"));
            achievementDao.save(new Achievement("MA1003", "Debate Competition", "Academic Achievement",
                    new File("documents/debate.csv"), new File("documents/support.pdf"), "Pending", "Multiple"));
            achievementDao.save(new Achievement("MA1004", "STEM Innovation Competition", "Innovation Achievement",
                    new File("documents/stem.csv"), new File(""), "Generated", "Multiple"));
            achievementDao.save(new Achievement("MA1005", "Kangaroo Math", "Academic Achievement",
                    new File("documents/math.xlxs"), new File("documents/others.pdf"), "Generated", "Multiple"));
		}
	}

	@Transactional
    public List<Achievement> getAllAchievements() {
        return achievementDao.getAllAchievements();
    }

	@Transactional
    public void saveAchievement(Achievement achievement) {
        achievementDao.save(achievement);
    }

	@Transactional
	public Achievement getAchievementByAchievementId(String achievementId) {
		return achievementDao.findByAchievementId(achievementId)
                .orElse(null);
	}
	
	@Transactional	
	public void deleteAchievement(String achievementId) {
    	achievementDao.deleteByAchievementId(achievementId);
    }
}
