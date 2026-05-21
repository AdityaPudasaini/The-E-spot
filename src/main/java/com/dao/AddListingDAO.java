package com.dao;

import com.model.CategoryModel;
import com.utils.DBConfig;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public class AddListingDAO {

    public ArrayList<CategoryModel> getCategories() throws SQLException {
    	
        ArrayList<CategoryModel> categories = new ArrayList<>();

        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT Category_ID, Category_Name FROM category ORDER BY Category_Name ASC";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            CategoryModel category = new CategoryModel();
            category.setCategoryId(rs.getInt("Category_ID"));
            category.setCategoryName(rs.getString("Category_Name"));
            categories.add(category);
        }

        rs.close();
        pst.close();
        conn.close();

        return categories;
    }

    public int addListing(String productName, String productDescription, double productPrice, int stockQuantity, int categoryId, String sellerUsername) throws SQLException {

        Connection conn = DBConfig.getConnection();

        int sellerId = codeMemberId(sellerUsername);

        String sqlCode = "INSERT INTO product (Category_ID, Seller_ID, Product_Name, Product_Description, Product_Price, Stock_Quantity, Listed_Date, Active_Status, isFlagged) VALUES (?, ?, ?, ?, ?, ?, ?, 'Active', false)";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode, PreparedStatement.RETURN_GENERATED_KEYS);
        
        pst.setInt(1, categoryId);
        pst.setInt(2, sellerId);
        pst.setString(3, productName);
        pst.setString(4, productDescription);
        pst.setDouble(5, productPrice);
        pst.setInt(6, stockQuantity);
        pst.setDate(7, Date.valueOf(LocalDate.now()));
        
        pst.executeUpdate();

        ResultSet rs = pst.getGeneratedKeys();
        
        int productId = 0;
        
        if (rs.next()) {
            productId = rs.getInt(1);
        }

        rs.close();
        pst.close();
        conn.close();

        return productId;
    }
    
    public int codeMemberId(String sellerUsername) throws SQLException{
    	
    	Connection conn = DBConfig.getConnection();

        String getSellerIdSql = "SELECT Member_ID FROM member WHERE Member_Username = ?";
        
        PreparedStatement pst = conn.prepareStatement(getSellerIdSql);
        pst.setString(1, sellerUsername);
        
        ResultSet rs = pst.executeQuery();

        int sellerId = 0;
        
        if (rs.next()) 
        {
            sellerId = rs.getInt("Member_ID");
        }

        rs.close();
        pst.close();
        conn.close();
        
        return sellerId;
    }
}