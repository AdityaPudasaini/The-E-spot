package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.UserStatsModel;
import com.utils.DBConfig;

public class UserDashboardDAO {
	
	public UserStatsModel totalRevenue(int memberId) throws SQLException {
 
		Connection conn = DBConfig.getConnection();
 
		String sql = "SELECT COALESCE(SUM(pay.Payment_Amount), 0) AS totalRevenue FROM payment pay JOIN `order` o ON pay.Order_ID  = o.Order_ID JOIN order_item oi ON oi.Order_ID= o.Order_ID JOIN product p ON oi.Product_ID = p.Product_ID WHERE p.Seller_ID = ? AND pay.Payment_Status = 'Completed'";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setInt(1, memberId);
		
		ResultSet rs = pst.executeQuery();
		
		UserStatsModel stats = new UserStatsModel();
 
		if (rs.next())
		{
			stats.setTotalRevenue(String.format("%.2f", rs.getDouble("totalRevenue")));
		}
		rs.close();
		pst.close();
		conn.close();
 
		return stats;
	}
}
