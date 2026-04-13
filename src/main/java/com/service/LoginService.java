package com.service;

import com.dao.MemberDAO;
import com.model.MemberModel;
import com.utils.PasswordUtil;

public class LoginService {
	
	MemberDAO memberDAO = new MemberDAO();
	
	public String authenticate(String email, String password) {
		
		if (email == null || email.trim().isEmpty()) {
            return "Username is required";
        }
		
        if (password == null || password.isEmpty()) {
            return "Password is required";
        }
        
        try {
            MemberModel member = memberDAO.getMemberRecordByEmail(email);

            if (member == null) {
                return "User doesn't exists";
            }
            
            if (!email.equals(member.getEmail())) {
            	return "Wrong email";
            }

            if (PasswordUtil.checkPassword(password, member.getPassword()) && email.equals(member.getEmail())) {
                return "Success";
            } 
            else {
                return "Password is incorrect";
            }

        } 
        
        catch (Exception e) {
            e.printStackTrace();
            return "Error in Database";
        }
	}

}
