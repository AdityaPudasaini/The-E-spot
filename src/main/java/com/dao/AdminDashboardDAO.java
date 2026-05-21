package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.AdminDashboardModel;
import com.utils.DBConfig;

public class AdminDashboardDAO {

	//To get the total revenue to display in the dashboard
	public AdminDashboardModel totalRevenue() throws SQLException {
		AdminDashboardModel total = new AdminDashboardModel();
		
		Connection conn = DBConfig.getConnection();
		
		String revenue = "SELECT SUM(Payment_Amount) AS TotalRevenue FROM payment WHERE Payment_Status = 'Completed'";
		PreparedStatement pst = conn.prepareStatement(revenue);
		ResultSet rs = pst.executeQuery();
		
        if (rs.next())
        {
            total.setTotalRevenue(String.format("%.2f", rs.getDouble("totalRevenue")));
        }
        rs.close();
        pst.close();
        conn.close();
        
        return total;
	}
	//To get the total product sold to display in the dashboard
	public AdminDashboardModel totalProductSOld() throws SQLException {
		AdminDashboardModel total = new AdminDashboardModel();
		
		Connection conn = DBConfig.getConnection();
		
		String productSold = "SELECT SUM(ordItm.Item_Quantity) AS totalSold FROM order_item ordItm JOIN `order` ord ON ordItm.Order_ID = ord.Order_ID WHERE ord.Order_Status = 'Completed'";
		PreparedStatement pst = conn.prepareStatement(productSold);
		ResultSet rs = pst.executeQuery();
        
        if (rs.next()) 
        {
        	total.setTotalSold(rs.getInt("totalSold"));
        }
        rs.close();
        pst.close();
        conn.close();
        
        return total;
	}

	//To get the total listed product to display in the dashboard
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

	//To get the total users to display in the dashboard
	public AdminDashboardModel totalVisitors() throws SQLException {
	    AdminDashboardModel total = new AdminDashboardModel();
	    
	    Connection conn = DBConfig.getConnection();
	    String sql = "SELECT COUNT(*) AS totalVisitors FROM member";
	    PreparedStatement pst = conn.prepareStatement(sql);
	    ResultSet rs = pst.executeQuery();
	    
	    if (rs.next()) 
	    {
	        total.setTotalVisitors(rs.getInt("totalVisitors"));
	    }
	    
	    rs.close();
	    pst.close();
	    conn.close();
	    return total;
	}

	//To get the flagged products to display in the dashboard
	public AdminDashboardModel flaggedProducts() throws SQLException {
		AdminDashboardModel total = new AdminDashboardModel();
		
		Connection conn = DBConfig.getConnection();
		
		String flaggedProducts = "SELECT Product_ID, Product_Name, Listed_Date FROM product WHERE isFlagged = true AND Active_Status != 'Banned' LIMIT 2";
		PreparedStatement pst = conn.prepareStatement(flaggedProducts);
		ResultSet rs = pst.executeQuery();
		 
	    int count = 0;
	     
	    while (rs.next() && count < 2) 
	    {
	    	if (count == 0) 
	    	{
	    		total.setFlaggedProductId(rs.getInt("Product_ID"));
	    		total.setFlaggedProductName(rs.getString("Product_Name"));
	    		total.setFlaggedProductDate(rs.getString("Listed_Date"));
	        } 
	    	
	    	else 
	    	{
	    		total.setFlaggedProductId2(rs.getInt("Product_ID"));
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

	//To get the remove a flagged product
	public void removeProduct(int flaggedProductId) throws SQLException {
		Connection conn = DBConfig.getConnection();
		
		String removeProduct = "UPDATE product SET Active_Status = 'Banned' WHERE Product_ID = ?";
		PreparedStatement pst = conn.prepareStatement(removeProduct);
		pst.setInt(1, flaggedProductId);
		pst.executeUpdate();
		
		pst.close();
		conn.close();
	}

	//to change the flagged status from flagged
	public void keepProduct(int flaggedProductId) throws SQLException {
		Connection conn = DBConfig.getConnection();
		
		String keepProduct = "UPDATE product SET isFlagged = false, Active_Status = 'Active' WHERE Product_ID = ?";
		PreparedStatement pst = conn.prepareStatement(keepProduct);
		pst.setInt(1, flaggedProductId);
		pst.executeUpdate();
		
		pst.close();
		conn.close();
	}

	//To  retrieve the recent listings
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
            	total.setRecentPrice1(String.format("%.2f", rs.getDouble("Product_Price")));
            } 
            
            else if (i == 1) 
            {
            	total.setRecentProduct2(rs.getString("Product_Name"));
                total.setRecentSeller2(rs.getString("Member_Name"));
                total.setRecentPrice2(String.format("%.2f", rs.getDouble("Product_Price")));
            } 
            
            else 
            {
            	total.setRecentProduct3(rs.getString("Product_Name"));
                total.setRecentSeller3(rs.getString("Member_Name"));
                total.setRecentPrice3(String.format("%.2f", rs.getDouble("Product_Price")));
            }
            
            i++;
        }
		
        rs.close();
        pst.close();
        conn.close();
        
        return total;	
	}
}
