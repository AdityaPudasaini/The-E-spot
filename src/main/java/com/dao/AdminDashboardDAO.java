package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.AdminDashboardModel;
import com.utils.DBConfig;

public class AdminDashboardDAO {
	
	public void getTotalRevenue() throws SQLException {
		AdminDashboardModel total = new AdminDashboardModel();
		
		Connection conn = DBConfig.getConnection();
		
		String revenue = "SELECT SUM(Payment_Amount) AS TotalRevenue FROM payment WHERE Payment_Status = Completed";
		PreparedStatement pst = conn.prepareStatement(revenue);
		ResultSet rs = pst.executeQuery();
		
        if (rs.next())
        {
            total.setTotalRevenue(rs.getDouble("totalRevenue"));
        }
        rs.close();
        pst.close();
	}
	
	
}
