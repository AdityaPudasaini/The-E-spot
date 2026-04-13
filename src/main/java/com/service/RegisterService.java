package com.service;

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
}
