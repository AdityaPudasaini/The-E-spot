package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import com.model.MemberModel;
import com.utils.DBConfig;

public class MemberDAO {
	
	public void insertMember(String name, String username, String dob,
            String email, String number, String password, java.sql.Date currentDate, String accountStatus) throws Exception {
			
			if(getMemberRecordByEmail(email) != null) {
		        throw new Exception("Email is already in use.");
		    }
		    
		    if(getMemberRecordByPhone(number) != null) {
		        throw new Exception("Phone number is already in use.");
		    }
		    
		    if(getMemberRecordByUsername(username) != null) {
		        throw new Exception("Username is already in use.");
		    }
		    
			LocalDate localDate = LocalDate.parse(dob); 
			Date sqlDate = Date.valueOf(localDate);
			
			Connection con = DBConfig.getConnection();
			
			String sql = "INSERT INTO member (Member_Name, Member_Email, Member_Password, Member_DOB, Member_Phone, Account_Status, Created_At, Member_Username) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, password);
			pst.setDate(4, sqlDate);
			pst.setString(5, number);
			pst.setString(6, accountStatus);
			pst.setDate(7, currentDate);	
			pst.setString(8, username);			
			pst.executeUpdate();
			pst.close();
			con.close();
		}
	
	public ArrayList <MemberModel> getMemberRecords() throws SQLException {
		
		ArrayList <MemberModel> member = new ArrayList<> ();
		Connection con = DBConfig.getConnection();
        
        String sql = "SELECT * FROM member";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            MemberModel singleMemberRecord = new MemberModel();
            singleMemberRecord.setMemberId(rs.getInt("Member_ID"));
            singleMemberRecord.setName(rs.getString("Member_Name"));
            singleMemberRecord.setEmail(rs.getString("Member_Email"));
            singleMemberRecord.setPassword(rs.getString("Member_Password"));
            singleMemberRecord.setDob(rs.getDate("Member_DOB"));
            singleMemberRecord.setNumber(rs.getString("Member_Phone"));
            singleMemberRecord.setAccountStatus(rs.getString("Account_Status"));
            singleMemberRecord.setCreatedDate(rs.getDate("Created_At"));
            singleMemberRecord.setUserName(rs.getString("Member_Username"));
            
            member.add(singleMemberRecord);
        }
        
        rs.close();
        pst.close();
        con.close();
        return member;
	}
	
	public MemberModel getMemberRecordByEmail(String email) throws Exception {
		MemberModel uniqueMember = null;
        Connection con = DBConfig.getConnection();
        
        String sql = "SELECT * FROM member WHERE Member_Email = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, email);
        
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
        	uniqueMember = new MemberModel();
        	uniqueMember.setMemberId(rs.getInt("Member_ID"));
        	uniqueMember.setName(rs.getString("Member_Name"));
        	uniqueMember.setEmail(rs.getString("Member_Email"));
        	uniqueMember.setPassword(rs.getString("Member_Password"));
        	uniqueMember.setDob(rs.getDate("Member_DOB"));
        	uniqueMember.setNumber(rs.getString("Member_Phone"));
        	uniqueMember.setAccountStatus(rs.getString("Account_Status"));
        	uniqueMember.setCreatedDate(rs.getDate("Created_At"));
        	uniqueMember.setUserName(rs.getString("Member_Username"));
        }

        rs.close();
        pst.close();
        con.close();
        return uniqueMember;
    }
	
	public MemberModel getMemberRecordByPhone(String number) throws Exception {
		MemberModel uniqueMember = null;
        Connection con = DBConfig.getConnection();
        
        String sql = "SELECT * FROM member WHERE Member_Phone = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, number);
        
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
        	uniqueMember = new MemberModel();
        	uniqueMember.setMemberId(rs.getInt("Member_ID"));
        	uniqueMember.setName(rs.getString("Member_Name"));
        	uniqueMember.setEmail(rs.getString("Member_Email"));
        	uniqueMember.setPassword(rs.getString("Member_Password"));
        	uniqueMember.setDob(rs.getDate("Member_DOB"));
        	uniqueMember.setNumber(rs.getString("Member_Phone"));
        	uniqueMember.setAccountStatus(rs.getString("Account_Status"));
        	uniqueMember.setCreatedDate(rs.getDate("Created_At"));
        	uniqueMember.setUserName(rs.getString("Member_Username"));
        }

        rs.close();
        pst.close();
        con.close();
        return uniqueMember;
    }
	
	public MemberModel getMemberRecordByUsername(String username) throws Exception {
		MemberModel uniqueMember = null;
        Connection con = DBConfig.getConnection();
        
        String sql = "SELECT * FROM member WHERE Member_Username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);
        
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
        	uniqueMember = new MemberModel();
        	uniqueMember.setMemberId(rs.getInt("Member_ID"));
        	uniqueMember.setName(rs.getString("Member_Name"));
        	uniqueMember.setEmail(rs.getString("Member_Email"));
        	uniqueMember.setPassword(rs.getString("Member_Password"));
        	uniqueMember.setDob(rs.getDate("Member_DOB"));
        	uniqueMember.setNumber(rs.getString("Member_Phone"));
        	uniqueMember.setAccountStatus(rs.getString("Account_Status"));
        	uniqueMember.setCreatedDate(rs.getDate("Created_At"));
        	uniqueMember.setUserName(rs.getString("Member_Username"));
        }

        rs.close();
        pst.close();
        con.close();
        return uniqueMember;
    }
	
	public MemberModel getMemberRecordById(int memberId) throws Exception {
		MemberModel uniqueMember = null;
        Connection con = DBConfig.getConnection();
        
        String sql = "SELECT * FROM member WHERE Member_ID = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, memberId);
        
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
        	uniqueMember = new MemberModel();
        	uniqueMember.setMemberId(rs.getInt("Member_ID"));
        	uniqueMember.setName(rs.getString("Member_Name"));
        	uniqueMember.setEmail(rs.getString("Member_Email"));
        	uniqueMember.setPassword(rs.getString("Member_Password"));
        	uniqueMember.setDob(rs.getDate("Member_DOB"));
        	uniqueMember.setNumber(rs.getString("Member_Phone"));
        	uniqueMember.setAccountStatus(rs.getString("Account_Status"));
        	uniqueMember.setCreatedDate(rs.getDate("Created_At"));
        	uniqueMember.setUserName(rs.getString("Member_Username"));
        }

        rs.close();
        pst.close();
        con.close();
        return uniqueMember;
    }
}
