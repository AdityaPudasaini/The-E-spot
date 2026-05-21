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

    public ArrayList<AdminOrderModel> getUserOrders(String username) throws SQLException {
        ArrayList<AdminOrderModel> orders = new ArrayList<>();

        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT o.Order_ID, p.Product_Name, c.Category_Name, oi.Item_Price, o.Order_Date, o.Order_Status FROM `order` o JOIN member m ON o.Member_ID = m.Member_ID JOIN order_item oi ON o.Order_ID = oi.Order_ID JOIN product p ON oi.Product_ID = p.Product_ID JOIN category c ON p.Category_ID = c.Category_ID WHERE m.Member_Username = ? ORDER BY o.Order_ID DESC";

        PreparedStatement pst = conn.prepareStatement(sqlCode);
        pst.setString(1, username);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
        	AdminOrderModel order = new AdminOrderModel();
            order.setOrderId(rs.getInt("Order_ID"));
            order.setProductName(rs.getString("Product_Name"));
            order.setCategoryName(rs.getString("Category_Name"));
            order.setAmount(String.format("%.2f", rs.getDouble("Item_Price")));
            order.setOrderDate(rs.getString("Order_Date").substring(0, 10));
            order.setOrderStatus(rs.getString("Order_Status"));
            orders.add(order);
        }

        rs.close();
        pst.close();
        conn.close();

        return orders;
    }

    public void deleteListing(int productId) throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "UPDATE product SET Active_Status = 'Banned' WHERE Product_ID = ?";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        pst.setInt(1, productId);
        
        pst.executeUpdate();
        
        pst.close();
        conn.close();
    }
}