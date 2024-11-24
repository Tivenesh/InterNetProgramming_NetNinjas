package com.tvpss.model;

public class CrewApplication {
	private String id;
    private String icNumber;
    private String fullName;
    private String position;
    private int form;
    private String status; // e.g., "Pending", "Approved", "Rejected"

    // Constructors
    public CrewApplication() {}

    public CrewApplication(String id, String icNumber, String fullName, String position, int form, String status) {
        this.id = id;
        this.icNumber = icNumber;
        this.fullName = fullName;
        this.position = position;
        this.form = form;
        this.status = status;
    }

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getForm() {
		return form;
	}

	public void setForm(int form) {
		this.form = form;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CrewApplication [id=" + id + ", icNumber=" + icNumber + ", fullName=" + fullName + ", position="
				+ position + ", form=" + form + ", status=" + status + "]";
	}
    
    
}
