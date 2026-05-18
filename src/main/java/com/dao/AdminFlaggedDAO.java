package com.dao;

import com.utils.DBConfig;
import com.model.AdminFlaggedModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminFlaggedDAO {

	public ArrayList<AdminFlaggedModel> allFlaggedItems(String status, String search) throws SQLException {
        ArrayList<AdminFlaggedModel> items = new ArrayList<>();

        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT f.Flag_ID, p.Product_ID, p.Product_Name, COALESCE(m.Member_Name, a.Admin_Name) AS reportedBy, f.Reason, f.Date_Reported, f.Flag_Status FROM flag_report f JOIN product p ON f.Product_ID = p.Product_ID LEFT JOIN member m ON f.Reported_By_Member = m.Member_ID LEFT JOIN admin a ON f.Reported_By_Admin = a.Admin_ID WHERE 1=1";

        ArrayList<Object> addedSqlCode = new ArrayList<>();

        if (status != null && !status.isEmpty()) 
        {
            sqlCode += " AND f.Flag_Status = ?";
            addedSqlCode.add(status);
        }

        if (search != null && !search.isEmpty()) 
        {
            sqlCode += " AND (p.Product_Name LIKE ? OR m.Member_Name LIKE ? OR a.Admin_Name LIKE ?)";
            addedSqlCode.add("%" + search + "%");
            addedSqlCode.add("%" + search + "%");
            addedSqlCode.add("%" + search + "%");
        }

        sqlCode += " ORDER BY f.Flag_ID DESC";

        PreparedStatement pst = conn.prepareStatement(sqlCode);

        for (int i = 0; i < addedSqlCode.size(); i++) 
        {
            pst.setObject(i + 1, addedSqlCode.get(i));
        }

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            AdminFlaggedModel item = new AdminFlaggedModel();
            item.setFlagId(rs.getInt("Flag_ID"));
            item.setProductId(rs.getInt("Product_ID"));
            item.setProductName(rs.getString("Product_Name"));
            item.setReportedBy(rs.getString("reportedBy"));
            item.setReason(rs.getString("Reason"));
            item.setDateReported(rs.getString("Date_Reported").substring(0, 10));
            item.setFlagStatus(rs.getString("Flag_Status"));
            items.add(item);
        }

        rs.close();
        pst.close();
        conn.close();

        return items;
    }

    public int totalFlagged() throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT COUNT(*) AS total FROM flag_report";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();
        
        int total = 0;
        
        if (rs.next()) 
        {
            total = rs.getInt("total");
        } 
        
        else 
        {
            total = 0;
        }
        
        rs.close(); 
        pst.close(); 
        conn.close();
        
        return total;
    }

    public void removeItem(int flagId) throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "UPDATE product SET Active_Status = 'Banned' WHERE Product_ID = (SELECT Product_ID FROM flag_report WHERE Flag_ID = ?)";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        
        pst.setInt(1, flagId);
        pst.executeUpdate();
        
        pst.close();
        conn.close();
    }

    public void unflagItem(int flagId) throws SQLException {
        
    	Connection conn = DBConfig.getConnection();
        
    	String sqlCode = "UPDATE product SET isFlagged = false, Active_Status = 'Active' WHERE Product_ID = (SELECT Product_ID FROM flag_report WHERE Flag_ID = ?)";
        
    	PreparedStatement pst = conn.prepareStatement(sqlCode);
    	
        pst.setInt(1, flagId);
        pst.executeUpdate();
        
        pst.close();
        conn.close();
    }
    
    
}