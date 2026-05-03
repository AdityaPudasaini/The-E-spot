package com.project.service;

import com.project.utils.PasswordUtil;
import com.project.dao.UserDAO;

public class RegisterService {
	UserDAO dao = new UserDAO();
	
	public void addUser(String fullName, String dob, String email,String phoneNumber,String password) throws Exception {
		
		password=PasswordUtil.getHashPassword(password); 
		dao.addUser(fullName,dob,email,phoneNumber,password);
	}
}
