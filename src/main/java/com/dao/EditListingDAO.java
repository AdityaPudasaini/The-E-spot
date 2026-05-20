package com.dao;

import com.model.CategoryModel;
import com.model.ProductDetailModel;
import com.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EditListingDAO {

    public ProductDetailModel getProductById(int productId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT p.Product_ID, p.Product_Name, p.Product_Description, p.Product_Price, p.Stock_Quantity, p.Active_Status, p.Listed_Date, c.Category_ID, c.Category_Name, m.Member_ID, m.Member_Username FROM product p JOIN category c ON p.Category_ID = c.Category_ID JOIN member m ON p.Seller_ID = m.Member_ID WHERE p.Product_ID = ?";

        PreparedStatement pst = conn.prepareStatement(sqlCode);
        pst.setInt(1, productId);

        ResultSet rs = pst.executeQuery();

        ProductDetailModel product = null;

        if (rs.next()) {
            product = new ProductDetailModel();

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

    public void updateListing(int productId, String productName, String productDescription, double productPrice, int stockQuantity, int categoryId) throws SQLException {

        Connection conn = DBConfig.getConnection();

        String sqlCode = "UPDATE product SET Product_Name = ?, Product_Description = ?, Product_Price = ?, Stock_Quantity = ?, Category_ID = ? WHERE Product_ID = ?";

        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setString(1, productName);
        pst.setString(2, productDescription);
        pst.setDouble(3, productPrice);
        pst.setInt(4, stockQuantity);
        pst.setInt(5, categoryId);
        pst.setInt(6, productId);

        pst.executeUpdate();

        pst.close();
        conn.close();
    }
}