package com.service;

import java.time.LocalDate;
import java.time.Period;

import com.dao.MemberDAO;
import com.utils.PasswordUtil;

public class RegisterService {
	MemberDAO dao = new MemberDAO();

    public void addStudent(String name, String username, String dob,
                           String email, String number, String password, java.sql.Date currentDate, String accountStatus) throws Exception {
    	// For hashing password
    	password=PasswordUtil.getHashPassword(password); 
    	
        dao.insertMember(name, username, dob, email, number, password, currentDate, accountStatus);
    }
    
    public String validateMember(String name, String username, String dob, String email, String number, String password) {
    	
        if (name == null || name.isBlank() || username == null || username.isBlank() || dob == null || dob.isBlank() || email == null || email.isBlank() || number == null || number.isBlank() || password == null || password.isBlank()) {
            return "Fill up all the credenttials.";
        }
        
        LocalDate birthDate = LocalDate.parse(dob);
        LocalDate today = LocalDate.now();
        
        if (birthDate.isAfter(today)) 
        {
            return "Date of birth cannot be in the future.";
        }
        
        if (Period.between(birthDate, today).getYears() < 13) 
        {
            return "Invalid date of birth. You must be at least 13 years old.";
        }
        
        if (!email.endsWith("@gmail.com")) 
        {
            return "Invalid email address!";
        }
        
        if (!number.startsWith("98") || number.length() != 10) 
        {
            return "Invalid phone number!";
        }
        
        if (password.length() < 10) {
            return "Invalid password. Needs to be at least 10 characters long!";
        }
        
        else 
        {
        	return null;
        }
    }
}
