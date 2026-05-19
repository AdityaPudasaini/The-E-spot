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

    
}