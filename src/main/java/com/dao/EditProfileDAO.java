package com.dao;

import com.utils.DBConfig;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EditProfileDAO {

    public void updateProfile(int memberId, String name, String email, String phone, String dob) throws SQLException {
    	
        Connection conn = DBConfig.getConnection();

        String sqlCode = "UPDATE member SET Member_Name = ?, Member_Email = ?, Member_Phone = ?, Member_DOB = ? WHERE Member_ID = ?";

        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, phone);
        pst.setString(4, dob);
        pst.setInt(5, memberId);

        pst.executeUpdate();

        pst.close();
        conn.close();
    }

    public void updatePassword(int memberId, String newPassword) throws SQLException {
    	
        Connection conn = DBConfig.getConnection();

        String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        String sqlCode = "UPDATE member SET Member_Password = ? WHERE Member_ID = ?";

        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setString(1, hashed);
        pst.setInt(2, memberId);

        pst.executeUpdate();

        pst.close();
        conn.close();
    }

    public boolean checkCurrentPassword(int memberId, String currentPassword) throws SQLException {
    	
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Member_Password FROM member WHERE Member_ID = ?";

        PreparedStatement pst = conn.prepareStatement(sqlCode);
        pst.setInt(1, memberId);

        ResultSet rs = pst.executeQuery();

        boolean matches = false;

        if (rs.next()) {
            matches = BCrypt.checkpw(currentPassword, rs.getString("Member_Password"));
        }

        rs.close();
        pst.close();
        conn.close();

        return matches;
    }

    public boolean isEmailTaken(int memberId, String email) throws SQLException {
    	
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Member_ID FROM member WHERE Member_Email = ? AND Member_ID != ?";

        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setString(1, email);
        pst.setInt(2, memberId);

        ResultSet rs = pst.executeQuery();

        boolean taken = rs.next();

        rs.close();
        pst.close();
        conn.close();

        return taken;
    }

    public boolean isPhoneTaken(int memberId, String phone) throws SQLException {
    	
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Member_ID FROM member WHERE Member_Phone = ? AND Member_ID != ?";

        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setString(1, phone);
        pst.setInt(2, memberId);

        ResultSet rs = pst.executeQuery();

        boolean taken = rs.next();

        rs.close();
        pst.close();
        conn.close();

        return taken;
    }
}