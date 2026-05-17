package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.AdminListingModel;
import com.utils.DBConfig;

public class AdminListingDAO {
	
	public ArrayList <AdminListingModel> allListings() throws SQLException {
	    ArrayList <AdminListingModel> listings = new ArrayList<>();
	    
	    Connection conn = DBConfig.getConnection();
	    
	    String sqlCOde = "SELECT p.Product_ID, p.Product_Name, c.Category_Name, p.Product_Price, p.Stock_Quantity, p.Active_Status, p.isFlagged, p.Listed_Date FROM product p JOIN category c ON p.Category_ID = c.Category_ID WHERE p.Active_Status != 'Banned' ORDER BY p.Listed_Date DESC";	    
	    PreparedStatement pst = conn.prepareStatement(sqlCOde);
	    ResultSet rs = pst.executeQuery();
	    
	    while (rs.next()) {
	    	
	        AdminListingModel listing = new AdminListingModel();
	        listing.setProductId(rs.getInt("Product_ID"));
	        listing.setProductName(rs.getString("Product_Name"));
	        listing.setCategoryName(rs.getString("Category_Name"));
	        listing.setProductPrice(String.format("%.2f", rs.getDouble("Product_Price")));
	        listing.setStockQuantity(rs.getInt("Stock_Quantity"));
	        listing.setActiveStatus(rs.getString("Active_Status"));
	        listing.setIsFlagged(rs.getBoolean("isFlagged"));
	        listing.setListedDate(rs.getString("Listed_Date"));
	        listings.add(listing);
	    }
	    
	    rs.close();
	    pst.close();
	    conn.close();
	    
	    return listings;
	}
	
	public void flagProduct(int productId) throws SQLException {
		
	    Connection conn = DBConfig.getConnection();
	    
	    String sqlCOde = "UPDATE product SET isFlagged = true WHERE Product_ID = ?";
	    PreparedStatement pst = conn.prepareStatement(sqlCOde);
	    
	    pst.setInt(1, productId);
	    pst.executeUpdate();
	    
	    pst.close();
	    conn.close();
	}

	public void keepProduct(int productId) throws SQLException {
		
	    Connection conn = DBConfig.getConnection();
	    
	    String sqlCOde = "UPDATE product SET isFlagged = false, Active_Status = 'Active' WHERE Product_ID = ?";
	    PreparedStatement pst = conn.prepareStatement(sqlCOde);
	    
	    pst.setInt(1, productId);
	    pst.executeUpdate();
	    
	    pst.close();
	    conn.close();
	}
}
