package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.DashboardItemsModel;
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
	
	public UserStatsModel totalBought(int memberId) throws SQLException {
		
		Connection conn = DBConfig.getConnection();
 
		String sql = "SELECT COALESCE(SUM(oi.Item_Quantity), 0) AS totalBought FROM order_item oi JOIN `order` o ON oi.Order_ID = o.Order_ID WHERE o.Member_ID = ? AND o.Order_Status = 'Completed'";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setInt(1, memberId);
		
		ResultSet rs = pst.executeQuery();
		
		UserStatsModel stats = new UserStatsModel();
 
		if (rs.next())
		{
			stats.setTotalBought(rs.getInt("totalBought"));
		}
		
		rs.close();
		pst.close();
		conn.close();
 
		return stats;
	}
	
	public UserStatsModel totalSold(int memberId) throws SQLException {
		
		Connection conn = DBConfig.getConnection();

		String sql = "SELECT COALESCE(SUM(oi.Item_Quantity), 0) AS totalSold FROM order_item oi JOIN product p ON oi.Product_ID = p.Product_ID JOIN `order` o ON oi.Order_ID = o.Order_ID WHERE p.Seller_ID = ? AND o.Order_Status = 'Completed'";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setInt(1, memberId);
		
		ResultSet rs = pst.executeQuery();
		
		UserStatsModel stats = new UserStatsModel();

		if (rs.next())
		{
			stats.setTotalSold(rs.getInt("totalSold"));
		}
		
		rs.close();
		pst.close();
		conn.close();

		return stats;
	}
	
	public UserStatsModel totalSpent(int memberId) throws SQLException {
		
		Connection conn = DBConfig.getConnection();

		String sql = "SELECT COALESCE(SUM(pay.Payment_Amount), 0) AS totalSpent FROM payment pay JOIN `order` o ON pay.Order_ID = o.Order_ID WHERE o.Member_ID = ? AND pay.Payment_Status = 'Completed'";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setInt(1, memberId);
		
		ResultSet rs = pst.executeQuery();
		
		UserStatsModel stats = new UserStatsModel();

		if (rs.next())
		{
			stats.setTotalSpent(String.format("%.2f", rs.getDouble("totalSpent")));
		}
		
		rs.close();
		pst.close();
		conn.close();

		return stats;
	}
	
	public DashboardItemsModel cartItems(int memberId) throws SQLException {
		
		Connection conn = DBConfig.getConnection();

		String sql = "SELECT p.Product_Name, p.Product_Price FROM cart c JOIN cart_items ci ON ci.Cart_ID = c.Cart_ID JOIN product p ON p.Product_ID = ci.Product_ID WHERE c.Member_ID = ? ORDER BY ci.Cart_Items_ID DESC LIMIT 3";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setInt(1, memberId);
		
		ResultSet rs = pst.executeQuery();
		
		DashboardItemsModel items = new DashboardItemsModel();

		int i = 0;

		while (rs.next() && i < 3)
		{
			if (i == 0)
			{
				items.setItem1Name(rs.getString("Product_Name"));
				items.setItem1Price(String.format("%.2f", rs.getDouble("Product_Price")));
			}
			
			else if (i == 1)
			{
				items.setItem2Name(rs.getString("Product_Name"));
				items.setItem2Price(String.format("%.2f", rs.getDouble("Product_Price")));
			}
			
			else
			{
				items.setItem3Name(rs.getString("Product_Name"));
				items.setItem3Price(String.format("%.2f", rs.getDouble("Product_Price")));
			}
			
			i++;
		}
		
		rs.close();
		pst.close();
		conn.close();

		return items;
	}
	
	public DashboardItemsModel recentBought(int memberId) throws SQLException {
		
		Connection conn = DBConfig.getConnection();

		String sql = "SELECT p.Product_Name, oi.Item_Price FROM `order` o JOIN order_item oi ON oi.Order_ID = o.Order_ID JOIN product p ON p.Product_ID = oi.Product_ID WHERE o.Member_ID = ? AND o.Order_Status = 'Completed' ORDER BY o.Order_Date DESC LIMIT 3";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setInt(1, memberId);
		
		ResultSet rs = pst.executeQuery();
		
		DashboardItemsModel items = new DashboardItemsModel();

		int i = 0;

		while (rs.next() && i < 3)
		{
			if (i == 0)
			{
				items.setItem1Name(rs.getString("Product_Name"));
				items.setItem1Price(String.format("%.2f", rs.getDouble("Item_Price")));
			}
			
			else if (i == 1)
			{
				items.setItem2Name(rs.getString("Product_Name"));
				items.setItem2Price(String.format("%.2f", rs.getDouble("Item_Price")));
			}
			
			else
			{
				items.setItem3Name(rs.getString("Product_Name"));
				items.setItem3Price(String.format("%.2f", rs.getDouble("Item_Price")));
			}
			
			i++;
		}
		
		rs.close();
		pst.close();
		conn.close();

		return items;
	}
	
	public DashboardItemsModel wishlistItems(int memberId) throws SQLException {
		
		Connection conn = DBConfig.getConnection();

		String sql = "SELECT p.Product_Name, p.Product_Price FROM wishlist w JOIN wishlist_item wi ON wi.Wishlist_ID = w.Wishlist_ID JOIN product p ON p.Product_ID = wi.Product_ID WHERE w.Member_ID = ? ORDER BY wi.Added_Date DESC LIMIT 3";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setInt(1, memberId);
		
		ResultSet rs = pst.executeQuery();
		
		DashboardItemsModel items = new DashboardItemsModel();

		int i = 0;

		while (rs.next() && i < 3)
		{
			if (i == 0)
			{
				items.setItem1Name(rs.getString("Product_Name"));
				items.setItem1Price(String.format("%.2f", rs.getDouble("Product_Price")));
			}
			
			else if (i == 1)
			{
				items.setItem2Name(rs.getString("Product_Name"));
				items.setItem2Price(String.format("%.2f", rs.getDouble("Product_Price")));
			}
			
			else
			{
				items.setItem3Name(rs.getString("Product_Name"));
				items.setItem3Price(String.format("%.2f", rs.getDouble("Product_Price")));
			}
			
			i++;
		}
		
		rs.close();
		pst.close();
		conn.close();

		return items;
	}
	
	public DashboardItemsModel recentSold(int memberId) throws SQLException {
		
		Connection conn = DBConfig.getConnection();

		String sql = "SELECT p.Product_Name, oi.Item_Price FROM product p JOIN order_item oi ON oi.Product_ID = p.Product_ID JOIN `order` o ON o.Order_ID = oi.Order_ID WHERE p.Seller_ID = ? AND o.Order_Status = 'Completed' ORDER BY o.Order_Date DESC LIMIT 3";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setInt(1, memberId);
		
		ResultSet rs = pst.executeQuery();
		
		DashboardItemsModel items = new DashboardItemsModel();

		int i = 0;

		while (rs.next() && i < 3)
		{
			if (i == 0)
			{
				items.setItem1Name(rs.getString("Product_Name"));
				items.setItem1Price(String.format("%.2f", rs.getDouble("Item_Price")));
			}
			
			else if (i == 1)
			{
				items.setItem2Name(rs.getString("Product_Name"));
				items.setItem2Price(String.format("%.2f", rs.getDouble("Item_Price")));
			}
			
			else
			{
				items.setItem3Name(rs.getString("Product_Name"));
				items.setItem3Price(String.format("%.2f", rs.getDouble("Item_Price")));
			}
			
			i++;
		}
		
		rs.close();
		pst.close();
		conn.close();

		return items;
	}
}
