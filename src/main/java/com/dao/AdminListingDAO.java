package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.AdminListingModel;
import com.utils.DBConfig;

public class AdminListingDAO {
	
	public ArrayList <AdminListingModel> getAllListings() throws SQLException {
	    ArrayList <AdminListingModel> listings = new ArrayList<>();
	    
	    Connection conn = DBConfig.getConnection();
	    
	    String query = "SELECT p.Product_ID, p.Product_Name, c.Category_Name, p.Product_Price, p.Stock_Quantity, p.Active_Status, p.isFlagged, p.Listed_Date FROM product p JOIN category c ON p.Category_ID = c.Category_ID WHERE p.Active_Status != 'Banned'";
	    PreparedStatement pst = conn.prepareStatement(query);
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
}
