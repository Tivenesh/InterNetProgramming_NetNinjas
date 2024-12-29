package com.tvpss.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Represents the version information for a specific school.
 */
@Entity
@Table(name = "school_version")
public class SchoolVersion implements Serializable {

    @Id
    @Column(name = "school_code", nullable = false)
    private String schoolCode;       // School Code

    @Column(name = "school_name", nullable = false)
    private String schoolName;       // School Name

    @Column(name = "district", nullable = false)
    private String district;         // District

    @Column(name = "contact_person")
    private String contactPerson;    // Contact Person

    @Column(name = "version_status")
    private String versionStatus;    // Version Status

    @Column(name = "status")
    private String status;           // Status (Active/Inactive)

    @Column(name = "version", nullable = false)
    private int version;             // Version

    public SchoolVersion() {
    }

    public SchoolVersion(String schoolCode, String schoolName, String district, String contactPerson, String versionStatus, String status, int version) {
        this.schoolCode = schoolCode;
        this.schoolName = schoolName;
        this.district = district;
        this.contactPerson = contactPerson;
        this.versionStatus = versionStatus;
        this.status = status;
        this.version = version;
    }

    // Getters and Setters
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

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getVersionStatus() {
        return versionStatus;
    }

    public void setVersionStatus(String versionStatus) {
        this.versionStatus = versionStatus;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    @Override
    public String toString() {
        return "SchoolVersion{" +
                "schoolCode='" + schoolCode + '\'' +
                ", schoolName='" + schoolName + '\'' +
                ", district='" + district + '\'' +
                ", contactPerson='" + contactPerson + '\'' +
                ", versionStatus='" + versionStatus + '\'' +
                ", status='" + status + '\'' +
                ", version=" + version +
                '}';
    }
}
