package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.AdminUserModel;
import com.utils.DBConfig;

public class AdminUserDAO {
	
	public ArrayList<AdminUserModel> allUsers(String status, String search) throws SQLException {
		
        ArrayList<AdminUserModel> users = new ArrayList<>();

        Connection conn = DBConfig.getConnection();

        String query = "SELECT m.Member_ID, m.Member_Name, m.Member_Email, m.Member_Username, m.Account_Status, m.Member_Role, m.Created_At, COUNT(o.Order_ID) AS totalOrders FROM member m LEFT JOIN `order` o ON m.Member_ID = o.Member_ID WHERE m.Member_Role != 'Admin'";

        if (status != null && !status.isEmpty()) {
            query += " AND m.Account_Status = '" + status + "'";
        }

        if (search != null && !search.isEmpty()) {
            query += " AND (m.Member_Name LIKE '%" + search + "%' OR m.Member_Email LIKE '%" + search + "%')";
        }

        query += " GROUP BY m.Member_ID ORDER BY m.Created_At DESC";

        PreparedStatement pst = conn.prepareStatement(query);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            AdminUserModel user = new AdminUserModel();
            user.setMemberId(rs.getInt("Member_ID"));
            user.setMemberName(rs.getString("Member_Name"));
            user.setMemberEmail(rs.getString("Member_Email"));
            user.setMemberUsername(rs.getString("Member_Username"));
            user.setAccountStatus(rs.getString("Account_Status"));
            user.setMemberRole(rs.getString("Member_Role"));
            user.setCreatedAt(rs.getString("Created_At"));
            user.setTotalOrders(rs.getInt("totalOrders"));
            users.add(user);
        }

        rs.close();
        pst.close();
        conn.close();

        return users;
    }
	
	public void banUser(int memberId) throws SQLException {
		
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "UPDATE member SET Account_Status = 'Banned' WHERE Member_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        
        pst.setInt(1, memberId);
        pst.executeUpdate();
        	
        pst.close();
        conn.close();
    }
	
	public void unbanUser(int memberId) throws SQLException {
		
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "UPDATE member SET Account_Status = 'Active' WHERE Member_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        
        pst.setInt(1, memberId);
        pst.executeUpdate();
        
        pst.close();
        conn.close();
    }
}
