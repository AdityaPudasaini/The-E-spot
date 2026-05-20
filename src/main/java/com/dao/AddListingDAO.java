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

    
}