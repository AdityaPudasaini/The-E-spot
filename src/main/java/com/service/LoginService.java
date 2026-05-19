package com.service;

import com.dao.MemberDAO;
import com.dao.AdminDAO;
import com.model.AdminModel;
import com.model.MemberModel;
import com.utils.PasswordUtil;

public class LoginService {
	
	MemberDAO memberDAO = new MemberDAO();
	AdminDAO adminDAO = new AdminDAO();
	
	public String authenticate(String email, String password) {
	    
	    if (email == null || email.trim().isEmpty()) 
	    {
	        return "Email is required";
	    }
	    
	    if (password == null || password.isEmpty()) 
	    {
	        return "Password is required";
	    }
	    
	    try {
	    	
	        AdminModel admin = adminDAO.getAdminRecord();
	        
	        if (admin != null && email.equals(admin.getEmail())) 
	        {
	            if (PasswordUtil.checkPassword(password, admin.getPassword())) 
	            {
	                return "Admin";
	            } 
	            
	            else 
	            {
	                return "Password is incorrect";
	            }
	        }
	        
	        MemberModel member = memberDAO.getMemberRecordByEmail(email);
	        
	        if (member == null) 
	        {
	            return "User doesn't exist";
	        }
	        
	        if (!PasswordUtil.checkPassword(password, member.getPassword())) 
	        {
	            return "Password is incorrect";
	        }
	        
	        if (member.getAccountStatus().equals("Banned")) 
	        {
	            return "Your account has been banned";
	        }
	        
	        return "Success";
	    } 
	    
	    catch (Exception e) 
	    {
	        e.printStackTrace();
	        return "Error: " + e.getMessage();
	    }
	}

}
