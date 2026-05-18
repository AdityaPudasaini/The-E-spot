package com.dao;

import com.utils.DBConfig;
import com.model.AdminFlaggedModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminFlaggedDAO {

    public ArrayList<AdminFlaggedModel> allFlaggedItems(String search) throws SQLException {
        ArrayList<AdminFlaggedModel> items = new ArrayList<>();

        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT p.Product_ID, p.Product_Name, c.Category_Name, m.Member_Name, p.Listed_Date, p.Active_Status FROM product p JOIN category c ON p.Category_ID = c.Category_ID JOIN member m ON p.Seller_ID = m.Member_ID WHERE p.isFlagged = true AND p.Active_Status != 'Banned'";

        ArrayList<Object> addedSqlCode = new ArrayList<>();

        if (search != null && !search.isEmpty()) 
        {
            sqlCode += " AND (p.Product_Name LIKE ? OR m.Member_Name LIKE ?)";
            addedSqlCode.add("%" + search + "%");
            addedSqlCode.add("%" + search + "%");
        }

        sqlCode += " ORDER BY p.Product_ID DESC";

        PreparedStatement pst = conn.prepareStatement(sqlCode);

        for (int i = 0; i < addedSqlCode.size(); i++) {
            pst.setObject(i + 1, addedSqlCode.get(i));
        }

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            AdminFlaggedModel item = new AdminFlaggedModel();
            item.setProductId(rs.getInt("Product_ID"));
            item.setProductName(rs.getString("Product_Name"));
            item.setCategoryName(rs.getString("Category_Name"));
            item.setSellerName(rs.getString("Member_Name"));
            item.setListedDate(rs.getString("Listed_Date"));
            item.setActiveStatus(rs.getString("Active_Status"));
            items.add(item);
        }

        rs.close();
        pst.close();
        conn.close();

        return items;
    }

    public int totalFlagged() throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT COUNT(*) AS total FROM product WHERE isFlagged = true AND Active_Status != 'Banned'";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();
        
        int total = 0;
        
        if (rs.next()) 
        {
            total = rs.getInt("total");
        } 
        
        else 
        {
            total = 0;
        }
        
        rs.close(); 
        pst.close(); 
        conn.close();
        
        return total;
    }

    
}