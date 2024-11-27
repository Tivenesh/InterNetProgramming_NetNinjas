package com.tvpss.service;

import com.tvpss.model.Achievement;

import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class AchievementService {
	private static final List<Achievement> achievements = new ArrayList<>();
	
	/*static {
		achievements.add(new Achievement("SA1001", "MSSD JB Badminton", "Sport Achievement", "Single",  "Pending"));
    	achievements.add(new Achievement("MA1001", "International Olympiad Mathematical", "Academic Achievement", "Multiple",  "Pending"));
    	achievements.add(new Achievement("MA1002", "MSSZ Athletic Tournament", "Sport Achievement", "Multiple",  "Generated"));
    	achievements.add(new Achievement("SA1002", "Singing Competition", "Cultural Achievement", "Single",  "Generated"));
    	achievements.add(new Achievement("SA1003", "Essay Competition", "Academic Achievement", "Single",  "Pending"));
    }*/

    // Single
	static {
    	achievements.add(new Achievement("SA1001", "070101145678", "Ahmad bin Abdullah", "MSSD JB Badminton", "Sport Achievement", "Badminton", "Champion", "Pending", "Single"));
    	achievements.add(new Achievement("SA1002", "050607034455", "Siti binti Ibrahim", "Singing Competition", "Cultural Achievement", "Old Folks", "Bronze", "Generated", "Single"));
    	achievements.add(new Achievement("SA1003", "984575757577", "Lim Jing Xuan", "Essay Competition", "Academic Achievement", "English Writing", "Champion", "Pending", "Single"));
    	achievements.add(new Achievement("SA1004", "040303006056", "Joanne Lim", "Debate Competition", "Academic Achievement", "Malay Debate", "Runner-up", "Generated", "Single"));
    	achievements.add(new Achievement("SA1005", "083456789012", "Law Shi Jing", "Kangaroo Math", "Academic Achievement", "Math", "Participation", "Pending", "Single"));
    }
	
	// Multiple
	static {
    	achievements.add(new Achievement("MA1001", "International Olympiad Mathematical", "Academic Achievement", new File("documents/math.xslx"), new File("documents/support.pdf"), "Pending", "Multiple"));
    	achievements.add(new Achievement("MA1002", "MSSZ Athletic Tournament", "Sport Achievememt", new File("documents/sport.xslx"), new File("documents/support.pdf"), "Generated", "Multiple"));
    	achievements.add(new Achievement("MA1003", "Debate Competition", "Academic Achievement", new File("documents/debate.csv"), new File("documents/support.pdf"), "Pending", "Multiple"));
    	achievements.add(new Achievement("MA1004", "STEM Innovation Competition", "Innovation Achievement", new File("documents/stem.csv"), new File(""), "Generated", "Multiple"));
    	achievements.add(new Achievement("MA1005", "Kangaroo Math", "Academic Achievement", new File("documents/math.xlxs"), new File("documents/others.pdf"), "Generated", "Multiple"));
    }

    public List<Achievement> getAllAchievements() {
        return achievements;
    }

    public void addAchievement(Achievement achievement) {
        achievements.add(achievement);
    }

	public Achievement getAchievementByAchievementId(String achievementId) {
		return achievements.stream()
                .filter(achievement -> achievement.getAchievementId().equals(achievementId))
                .findFirst()
                .orElse(null);
	}
	
    @SuppressWarnings("unlikely-arg-type")
	public void deleteAchievement(String achievementId) {
    	achievements.remove(achievementId);
    }
}
