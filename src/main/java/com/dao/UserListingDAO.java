package com.dao;

import com.model.AdminListingModel;
import com.model.AdminOrderModel;
import com.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserListingDAO {

    public ArrayList<AdminListingModel> getUserListings(String username) throws SQLException {
        ArrayList<AdminListingModel> listings = new ArrayList<>();

        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT p.Product_ID, p.Product_Name, c.Category_Name, p.Product_Price, p.Stock_Quantity, p.Active_Status, p.isFlagged, p.Listed_Date FROM product p JOIN category c ON p.Category_ID = c.Category_ID JOIN member m ON p.Seller_ID = m.Member_ID WHERE m.Member_Username = ? AND p.Active_Status != 'Banned' ORDER BY p.Product_ID DESC";

        PreparedStatement pst = conn.prepareStatement(sqlCode);
        pst.setString(1, username);
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