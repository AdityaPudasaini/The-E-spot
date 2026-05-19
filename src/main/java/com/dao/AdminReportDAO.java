package com.dao;

import com.utils.DBConfig;
import com.model.AdminReportModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminReportDAO {

    public int totalExports() throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT COUNT(*) AS total FROM export_history";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();
        
        int total = 0;
        
        if (rs.next()) {
            total = rs.getInt("total");
        }
        
        rs.close();
        pst.close();
        conn.close();
        
        return total;
    }

    public String lastExportDate() throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT Export_Date FROM export_history ORDER BY Export_Date DESC LIMIT 1";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();
        
        String date = "Never";
        
        if (rs.next()) {
            date = rs.getString("Export_Date").substring(0, 10);
        }
        
        rs.close();
        pst.close();
        conn.close();
        
        return date;
    }

    
}