package com.tvpss.model;

public class Certificate {
	private String certificateId;
    private String schoolCode;
    private String schoolName;
    private String category;
    private String formMode;
    private String status;
    
 // Constructors
	public Certificate() {}
    
	public Certificate(String certificateId, String schoolCode, String schoolName, String category, String formMode, String status) {
		this.certificateId = certificateId;
		this.schoolCode = schoolCode;
		this.schoolName = schoolName;
		this.category = category;
		this.formMode = formMode;
		this.status = status;
	}

	public String getCertificateId() {
		return certificateId;
	}

	public void setCertificateId(String certificateId) {
		this.certificateId = certificateId;
	}

	public String getSchoolCode() {
		return schoolCode;
	}

	public void setSchoolCode(String schoolCode) {
		this.schoolCode = schoolCode;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
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

}