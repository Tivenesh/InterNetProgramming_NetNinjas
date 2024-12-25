package com.tvpss.model;

import javax.persistence.*;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

@Entity
@Table(name = "school")
public class School implements Serializable {

    @Id
    @Column(name = "code")
    private String code;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "address1", nullable = false)
    private String address1;

    @Column(name = "address2")
    private String address2;

    @Column(name = "postcode", nullable = false)
    private String postcode;

    @Column(name = "state", nullable = false)
    private String state;

    @Column(name = "telephone_number")
    private String telephoneNumber;

    @Column(name = "email", unique = true, nullable = false)
    private String email;

    @Lob
    @Column(name = "logo")
    private MultipartFile logo;

    @Column(name = "youtube_link")
    private String youtubeLink;

    @Column(name = "logo_filename")
    private String logoFilename;

    public School() {
    }

    public String getLogoFilename() {
        return logoFilename;
    }

    public void setLogoFilename(String logoFilename) {
        this.logoFilename = logoFilename;
    }

    // Getters and Setters
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    public void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public MultipartFile getLogo() {
        return logo;
    }

    public void setLogo(MultipartFile logo) {
        this.logo = logo;
    }

    public String getYoutubeLink() {
        return youtubeLink;
    }

    public void setYoutubeLink(String youtubeLink) {
        this.youtubeLink = youtubeLink;
    }

    @Override
    public String toString() {
        return "School{" +
               "code='" + code + '\'' +
               ", name='" + name + '\'' +
               ", address1='" + address1 + '\'' +
               ", address2='" + address2 + '\'' +
               ", postcode='" + postcode + '\'' +
               ", state='" + state + '\'' +
               ", telephoneNumber='" + telephoneNumber + '\'' +
               ", email='" + email + '\'' +
               ", youtubeLink='" + youtubeLink + '\'' +
               '}';
    }
}
