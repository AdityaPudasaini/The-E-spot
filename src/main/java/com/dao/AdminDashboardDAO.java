package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.AdminDashboardModel;
import com.utils.DBConfig;

public class AdminDashboardDAO {
	
	public AdminDashboardModel totalRevenue() throws SQLException {
		AdminDashboardModel total = new AdminDashboardModel();
		
		Connection conn = DBConfig.getConnection();
		
		String revenue = "SELECT SUM(Payment_Amount) AS TotalRevenue FROM payment WHERE Payment_Status = 'Completed'";
		PreparedStatement pst = conn.prepareStatement(revenue);
		ResultSet rs = pst.executeQuery();
		
        if (rs.next())
        {
            total.setTotalRevenue(rs.getDouble("totalRevenue"));
        }
        rs.close();
        pst.close();
        conn.close();
        
        return total;
	}
	
	public AdminDashboardModel totalProductSOld() throws SQLException {
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
        conn.close();
        
        return total;
	}
	
	public AdminDashboardModel totalProductListed() throws SQLException {
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
        conn.close();
        
        return total;
	}
	
	public AdminDashboardModel flaggedProducts() throws SQLException {
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
	     conn.close();
	     
	     return total;
	}
	
	public AdminDashboardModel recentListings() throws SQLException {
		AdminDashboardModel total = new AdminDashboardModel();
		
		Connection conn = DBConfig.getConnection();
		
		String recent = "SELECT p.Product_Name, m.Member_Name, p.Product_Price FROM product p JOIN member m ON p.Seller_ID = m.Member_ID WHERE p.Active_Status = 'Active' ORDER BY p.Listed_Date DESC LIMIT 3";
		PreparedStatement pst = conn.prepareStatement(recent);
		ResultSet rs = pst.executeQuery();
		
		int i = 0;
		
        while (rs.next() && i < 3) 
        {
            if (i == 0) 
            {
            	total.setRecentProduct1(rs.getString("Product_Name"));
            	total.setRecentSeller1(rs.getString("Member_Name"));
            	total.setRecentPrice1(rs.getDouble("Product_Price"));
            } 
            
            else if (i == 1) 
            {
            	total.setRecentProduct2(rs.getString("Product_Name"));
                total.setRecentSeller2(rs.getString("Member_Name"));
                total.setRecentPrice2(rs.getDouble("Product_Price"));
            } 
            
            else 
            {
            	total.setRecentProduct3(rs.getString("Product_Name"));
                total.setRecentSeller3(rs.getString("Member_Name"));
                total.setRecentPrice3(rs.getDouble("Product_Price"));
            }
            
            i++;
        }
		
        rs.close();
        pst.close();
        conn.close();
        
        return total;	}
}
