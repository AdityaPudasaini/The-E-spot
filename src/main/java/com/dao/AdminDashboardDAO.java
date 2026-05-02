package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.AdminDashboardModel;
import com.utils.DBConfig;

public class AdminDashboardDAO {
	
	public void totalRevenue() throws SQLException {
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
	
	public void totalProductSOld() throws SQLException {
		AdminDashboardModel total = new AdminDashboardModel();
		
		Connection conn = DBConfig.getConnection();
		
		String productSold = "SELECT SUM(ordItm.Item_Quantity) AS totalSold FROM order_item ordItm JOIN `order` ord ON ordItm.Order_ID = ord.Order_ID WHERE ord.Order_Status = 'Completed'";
		PreparedStatement pst = conn.prepareStatement(productSold);
		ResultSet rs = pst.executeQuery();
		pst = conn.prepareStatement(productSold);
        rs = pst.executeQuery();
        
        if (rs.next()) 
        {
        	total.setTotalSold(rs.getInt("totalSold"));
        }
        rs.close();
        pst.close();
	}
	
	public void totalProductListed() throws SQLException {
		AdminDashboardModel total = new AdminDashboardModel();
		
		Connection conn = DBConfig.getConnection();
		
		String totalSold = "SELECT COUNT(*) AS totalListed FROM product WHERE Active_Status = 'Active'";
		PreparedStatement pst = conn.prepareStatement(totalSold);
		ResultSet rs = pst.executeQuery();
		
        if (rs.next())
        {
            total.setTotalListed(rs.getInt("totalListed"));
        }
        rs.close();
        pst.close();
	}
	
	public void flaggedProducts() throws SQLException {
		AdminDashboardModel total = new AdminDashboardModel();
		
		Connection conn = DBConfig.getConnection();
		
		 String flaggedProducts = "SELECT Product_Name, Listed_Date FROM product WHERE Active_Status = 'Flagged' LIMIT 2";
		 PreparedStatement pst = conn.prepareStatement(flaggedProducts);
		 ResultSet rs = pst.executeQuery();
		 
	     int count = 0;
	     
	     while (rs.next() && count < 2) 
	     {
	    	 if (count == 0) 
	    	 {
	    		 total.setFlaggedProductName(rs.getString("Product_Name"));
	    		 total.setFlaggedProductDate(rs.getString("Listed_Date"));
	         } 
	    	 
	    	 else 
	    	 {
	    		 total.setFlaggedProductName2(rs.getString("Product_Name"));
	    		 total.setFlaggedProductDate2(rs.getString("Listed_Date"));
	         }
	         	count++;
	     }
	     rs.close();
	     pst.close();
	}
	
	
}
