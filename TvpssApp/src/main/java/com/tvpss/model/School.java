package com.tvpss.model;

import org.springframework.web.multipart.MultipartFile;

public class School {
    private String code;
    private String name;
    private String address1;
    private String address2;
    private String postcode;
    private String state;
    private String telephoneNumber;
    private String email;
    private MultipartFile logo;
    private String youtubeLink;
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
               ", logo='" + logo + '\'' +
               ", youtubeLink='" + youtubeLink + '\'' +
               '}';
    }
}
