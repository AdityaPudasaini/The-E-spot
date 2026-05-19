package com.dao;

import com.model.ProductListingModel;
import com.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductListingDAO 
{

    public ArrayList<ProductListingModel> getAllListings(String search, String category) throws SQLException 
    {
        ArrayList<ProductListingModel> listings = new ArrayList<>();

        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT p.Product_ID, p.Product_Name, p.Product_Description, p.Product_Price, p.Stock_Quantity, p.Active_Status, p.Listed_Date, p.Seller_ID, c.Category_ID, c.Category_Name FROM product p JOIN category c ON p.Category_ID = c.Category_ID WHERE p.Active_Status = 'Active'";

        ArrayList<Object> addSqlCode = new ArrayList<>();

        if (category != null && !category.isEmpty()) 
        {
            sqlCode += " AND c.Category_Name = ?";
            addSqlCode.add(category);
        }

        if (search != null && !search.isEmpty()) 
        {
            sqlCode += " AND p.Product_Name LIKE ?";
            addSqlCode.add("%" + search + "%");
        }

        sqlCode += " ORDER BY p.Listed_Date DESC";

        PreparedStatement pst = conn.prepareStatement(sqlCode);

        for (int i = 0; i < addSqlCode.size(); i++) 
        {
            pst.setObject(i + 1, addSqlCode.get(i));
        }

        ResultSet rs = pst.executeQuery();

        while (rs.next()) 
        {
            ProductListingModel listing = new ProductListingModel();
            
            listing.setProductId(rs.getInt("Product_ID"));
            listing.setProductName(rs.getString("Product_Name"));
            listing.setProductDescription(rs.getString("Product_Description"));
            listing.setProductPrice(rs.getDouble("Product_Price"));
            listing.setStockQuantity(rs.getInt("Stock_Quantity"));
            listing.setActiveStatus(rs.getString("Active_Status"));
            listing.setListedDate(rs.getString("Listed_Date"));
            listing.setSellerId(rs.getInt("Seller_ID"));
            listing.setCategoryId(rs.getInt("Category_ID"));
            listing.setCategoryName(rs.getString("Category_Name"));
            
            listings.add(listing);
        }

        rs.close();
        pst.close();
        conn.close();

        return listings;
    }

    public ArrayList<String> getAllCategories() throws SQLException 
    {
        ArrayList<String> categories = new ArrayList<>();

        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Category_Name FROM category ORDER BY Category_Name";

        PreparedStatement pst = conn.prepareStatement(sqlCode);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) 
        {
            categories.add(rs.getString("Category_Name"));
        }

        rs.close();
        pst.close();
        conn.close();

        return categories;
    }
}