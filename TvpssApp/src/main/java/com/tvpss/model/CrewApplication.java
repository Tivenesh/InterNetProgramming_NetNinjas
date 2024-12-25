package com.tvpss.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "crew_application")
public class CrewApplication implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "ic_number", nullable = false)
    private String icNumber;

    @Column(name = "full_name", nullable = false)
    private String fullName;

    @Column(name = "position", nullable = false)
    private String position;

    @Column(name = "form", nullable = false)
    private int form;

    @Column(name = "status", nullable = false)
    private String status; // e.g., "Pending", "Approved", "Rejected"

    // Constructors
    public CrewApplication() {}

    public CrewApplication(Long id, String icNumber, String fullName, String position, int form, String status) {
        this.id = id;
        this.icNumber = icNumber;
        this.fullName = fullName;
        this.position = position;
        this.form = form;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
