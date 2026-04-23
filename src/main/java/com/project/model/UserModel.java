package com.project.model;

import java.sql.Date;
import java.time.LocalDate;

public class UserModel {
	private String fullName;
	private String phoneNumber;
	private String email;
	private String password;
	private Date dob;
	private String image;
	
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getDob() {
		return dob;
	}
	
	public void setDob(Date dob) {
		this.dob = dob;
		
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImage(){
		return image;
	}
	
	
	
}
