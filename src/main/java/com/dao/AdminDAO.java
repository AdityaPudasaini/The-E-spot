package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.AdminModel;
import com.utils.DBConfig;

public class AdminDAO {
	public AdminModel getAdminRecord() throws Exception {
		AdminModel admin = null;
        Connection con = DBConfig.getConnection();
        
        String sql = "SELECT * FROM admin";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
        	admin = new AdminModel();
        	admin.setName(rs.getString("Admin_Name"));
        	admin.setEmail(rs.getString("Admin_Email"));
        	admin.setPassword(rs.getString("Admin_Password"));
        	admin.setPermission(rs.getString("Admin_Permission"));
        	admin.setUserName(rs.getString("Admin_Username"));
        }

        rs.close();
        pst.close();
        con.close();
        return admin;
    }
}
