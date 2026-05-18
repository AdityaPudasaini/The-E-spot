package com.dao;

import com.utils.DBConfig;
import com.model.AdminRevenueModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminRevenueDAO {

    public ArrayList<AdminRevenueModel> allOrders(String status, String search) throws SQLException {
        ArrayList<AdminRevenueModel> orders = new ArrayList<>();

        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT o.Order_ID, m.Member_Name, p.Product_Name, c.Category_Name, oi.Item_Price, o.Order_Date, o.Order_Status FROM `order` o JOIN member m ON o.Member_ID = m.Member_ID JOIN order_item oi ON o.Order_ID = oi.Order_ID JOIN product p ON oi.Product_ID = p.Product_ID JOIN category c ON p.Category_ID = c.Category_ID WHERE 1=1";

        if (status != null && !status.isEmpty()) 
        {
            sqlCode += " AND o.Order_Status = '" + status + "'";
        }

        if (search != null && !search.isEmpty()) 
        {
            sqlCode += " AND (m.Member_Name LIKE '%" + search + "%' OR p.Product_Name LIKE '%" + search + "%')";
        }

        sqlCode += " ORDER BY o.Order_Date DESC";

        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            AdminRevenueModel order = new AdminRevenueModel();
            order.setOrderId(rs.getInt("Order_ID"));
            order.setCustomerName(rs.getString("Member_Name"));
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

    public String totalRevenue() throws SQLException {
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT SUM(Payment_Amount) AS totalRevenue FROM payment WHERE Payment_Status = 'Completed'";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();

        String total = "0.00";
        
        if (rs.next()) {
            total = String.format("%.2f", rs.getDouble("totalRevenue"));
        }

        rs.close();
        pst.close();
        conn.close();
        
        return total;
    }

    public String revenueThisMonth() throws SQLException {
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT SUM(Payment_Amount) AS monthRevenue FROM payment WHERE Payment_Status = 'Completed' AND MONTH(Payment_Date) = MONTH(CURDATE()) AND YEAR(Payment_Date) = YEAR(CURDATE())";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();

        String total = "0.00";
        
        if (rs.next()) {
            total = String.format("%.2f", rs.getDouble("monthRevenue"));
        }

        rs.close();
        pst.close();
        conn.close();
        
        return total;
    }

    
}