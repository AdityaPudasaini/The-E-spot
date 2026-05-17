package com.project.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.project.model.UserModel;
import com.project.utils.DBconfig;

public class UserDAO {
	public void addUser(String fullName, String dob, String email, String phoneNumber, 
			String password) throws Exception {
		LocalDate localDate = LocalDate.parse(dob); //to convert dob string into java.time.LocalDate
		Date sqlDate = Date.valueOf(localDate);
		Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO member (Member_Name, Member_DOB, Member_Email, Member_Phone, Member_Password) "
                   + "VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = con.prepareStatement(sql);
		
        pst.setString(1,fullName);
        pst.setDate(2, sqlDate);
        pst.setString(3, email);
        pst.setString(4, phoneNumber);
        pst.setString(5, password);
        
        pst.executeUpdate();
        pst.close();
        con.close();
	}
	
	public List<UserModel> getAllStudents() throws Exception{
		List<UserModel> users = new ArrayList<>();
		Connection con = DBconfig.getConnection();
		
		String sql = "SELECT * FROM students";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        
        while(rs.next()) {
        	UserModel u = new UserModel();
        	u.setFullName(rs.getString("fullName"));
        	u.setDob(rs.getDate("dob"));
        	u.setEmail(rs.getString("email"));
        	u.setPhoneNumber(rs.getString("phoneNumber"));
        	u.setPassword(rs.getString("password"));
        	users.add(u);
        }
        rs.close();
        pst.close();
        con.close();
        return users;
	}
	public UserModel getUserByEmail(String email) throws Exception {
		UserModel u = null;
		Connection con = DBconfig.getConnection();
        
        String sql = "SELECT * FROM students WHERE email = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, email);
        
        ResultSet rs = pst.executeQuery();
        
        if(rs.next()) {
        	u = new UserModel();
        	u.setFullName(rs.getString("fullName"));
        	u.setDob(rs.getDate("dob"));
        	u.setEmail(rs.getString("email"));
        	u.setPhoneNumber(rs.getString("phoneNumber"));
        	u.setPassword(rs.getString("password"));
        }
        rs.close();
        pst.close();
        con.close();
        return u;
	}
}
