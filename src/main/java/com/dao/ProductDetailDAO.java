package com.dao;

import com.model.ProductListingModel;
import com.model.ReviewModel;
import com.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDetailDAO 
{

    public ProductListingModel getProductById(int productId) throws SQLException 
    {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT p.Product_ID, p.Product_Name, p.Product_Description, p.Product_Price, p.Stock_Quantity, p.Active_Status, p.Listed_Date, c.Category_ID, c.Category_Name, m.Member_ID, m.Member_Username FROM product p JOIN category c ON p.Category_ID = c.Category_ID JOIN member m ON p.Seller_ID = m.Member_ID WHERE p.Product_ID = ?";

        PreparedStatement pst = conn.prepareStatement(sqlCode);
        
        pst.setInt(1, productId);
        
        ResultSet rs = pst.executeQuery();

        ProductListingModel product = null;

        if (rs.next()) 
        {
            product = new ProductListingModel();
            
            product.setProductId(rs.getInt("Product_ID"));
            product.setProductName(rs.getString("Product_Name"));
            product.setProductDescription(rs.getString("Product_Description"));
            product.setProductPrice(rs.getDouble("Product_Price"));
            product.setStockQuantity(rs.getInt("Stock_Quantity"));
            product.setActiveStatus(rs.getString("Active_Status"));
            product.setListedDate(rs.getString("Listed_Date"));
            product.setCategoryId(rs.getInt("Category_ID"));
            product.setCategoryName(rs.getString("Category_Name"));
            product.setSellerId(rs.getInt("Member_ID"));
            product.setSellerUsername(rs.getString("Member_Username"));
        }

        rs.close();
        pst.close();
        conn.close();

        return product;
    }

    
}