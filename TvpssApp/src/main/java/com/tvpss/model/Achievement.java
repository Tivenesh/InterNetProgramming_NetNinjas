package com.tvpss.model;

import java.io.File;

public class Achievement {
    private String achievementId;
    private String activityName;
    private String category;
    private String formMode;
    private String status;
    //Single Form
    private String icNumber;
    private String fullName;
    private String subCategory;
    private String awardInfo; 
    //Multiple Form
    private File uploadDoc;
    private File supportDoc;

    public Achievement() {}
    
    //ViewAchievement
    public Achievement(String achievementId, String activityName, String category, String formMode, String status) {
		this.achievementId = achievementId;
		this.activityName = activityName;
		this.category = category;
        this.formMode = formMode;
        this.status = status;
    }
	
	//SingleAchievement
	public Achievement(String achievementId, String icNumber, String fullName, String activityName, String category,
			String subCategory, String awardInfo, String status, String formMode) {
		this.achievementId = achievementId;
        this.icNumber = icNumber;
        this.fullName = fullName;
		this.activityName = activityName;
		this.category = category;
        this.subCategory = subCategory;
        this.awardInfo = awardInfo;
        this.status = status;
        this.formMode = formMode;
    }
	
	//MultipleAchievement
	public Achievement(String achievementId, String activityName, String category, File uploadDoc, File supportDoc, String status, String formMode) {
		this.achievementId = achievementId;
		this.activityName = activityName;
		this.category = category;
        this.uploadDoc = uploadDoc;
        this.supportDoc = supportDoc;
        this.status = status;
        this.formMode = formMode;
    }

	public String getAchievementId() {
		return achievementId;
	}

	public void setAchievementId(String achievementId) {
		this.achievementId = achievementId;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFormMode() {
		return formMode;
	}

	public void setFormMode(String formMode) {
		this.formMode = formMode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIcNumber() {
		return icNumber;
	}

	public void setIcNumber(String icNumber) {
		this.icNumber = icNumber;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getAwardInfo() {
		return awardInfo;
	}

	public void setAwardInfo(String awardInfo) {
		this.awardInfo = awardInfo;
	}

	public File getUploadDoc() {
		return uploadDoc;
	}

	public void setUploadDoc(File uploadDoc) {
		this.uploadDoc = uploadDoc;
	}

	public File getSupportDoc() {
		return supportDoc;
	}

	public void setSupportDoc(File supportDoc) {
		this.supportDoc = supportDoc;
	}

}
