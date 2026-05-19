package com.dao;

import com.utils.DBConfig;
import com.model.AdminReportModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminReportDAO {

    public int totalExports() throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT COUNT(*) AS total FROM export_history";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();
        
        int total = 0;
        
        if (rs.next()) {
            total = rs.getInt("total");
        }
        
        rs.close();
        pst.close();
        conn.close();
        
        return total;
    }

    public String lastExportDate() throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT Export_Date FROM export_history ORDER BY Export_Date DESC LIMIT 1";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();
        
        String date = "Never";
        
        if (rs.next()) {
            date = rs.getString("Export_Date").substring(0, 10);
        }
        
        rs.close();
        pst.close();
        conn.close();
        
        return date;
    }

    public ArrayList<String[]> revenueReport() throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT p.Payment_ID, p.Payment_Date, p.Payment_Amount, p.Payment_Method, p.Payment_Status FROM payment p WHERE p.Payment_Status = 'Completed' ORDER BY p.Payment_Date DESC";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();
        
        ArrayList<String[]> rows = new ArrayList<>();
        
        rows.add(new String[]{"Payment ID", "Date", "Amount", "Method", "Status"});
        
        while (rs.next()) {
        	
            rows.add(new String[] {
            	String.valueOf(rs.getInt("Payment_ID")), 
	            rs.getString("Payment_Date").substring(0, 10),
	            String.format("%.2f", rs.getDouble("Payment_Amount")),
	            rs.getString("Payment_Method"),
	            rs.getString("Payment_Status")
            	}
            );
        }
        
        rs.close();
        pst.close();
        conn.close();
        
        return rows;
    }

    public ArrayList<String[]> ordersReport() throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT o.Order_ID, m.Member_Name, o.Order_Date, o.Order_Status FROM `order` o JOIN member m ON o.Member_ID = m.Member_ID ORDER BY o.Order_Date DESC";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();
        
        ArrayList<String[]> rows = new ArrayList<>();
        
        rows.add(new String[]{"Order ID", "Customer", "Date", "Status"});
        
        while (rs.next()) {
            rows.add(new String[] {
                String.valueOf(rs.getInt("Order_ID")),
                rs.getString("Member_Name"),
                rs.getString("Order_Date").substring(0, 10),
                rs.getString("Order_Status")
            	}
            );
        }
        
        rs.close();
        pst.close();
        conn.close();
        
        return rows;
    }

    public ArrayList<String[]> productsReport() throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT p.Product_ID, p.Product_Name, p.Product_Price, p.Stock_Quantity, p.Active_Status, p.Listed_Date FROM product p ORDER BY p.Listed_Date DESC";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();
        
        ArrayList<String[]> rows = new ArrayList<>();
        
        rows.add(new String[]{"Product ID", "Product Name", "Price", "Stock", "Status", "Listed Date"});
        
        while (rs.next()) {
        	
            rows.add(new String[] {
                String.valueOf(rs.getInt("Product_ID")),
                rs.getString("Product_Name"),
                String.format("%.2f", rs.getDouble("Product_Price")),
                String.valueOf(rs.getInt("Stock_Quantity")),
                rs.getString("Active_Status"),
                rs.getString("Listed_Date")
            	}
            );
        }
        
        rs.close();
        pst.close();
        conn.close();
        
        return rows;
    }

    public void storeExport(String reportType, String exportedBy, int rowCount, String status) throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "INSERT INTO export_history (Report_Type, Exported_By, Row_Count, Status) VALUES (?, ?, ?, ?)";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        
        pst.setString(1, reportType);
        pst.setString(2, exportedBy);
        pst.setInt(3, rowCount);
        pst.setString(4, status);
        
        pst.executeUpdate();
        
        pst.close();
        conn.close();
    }

    public ArrayList<AdminReportModel> allExports() throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT Export_ID, Report_Type, Exported_By, Export_Date, Row_Count, Status FROM export_history ORDER BY Export_Date DESC";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        ResultSet rs = pst.executeQuery();
        
        ArrayList<AdminReportModel> datas = new ArrayList<>();
        
        while (rs.next()) {
            AdminReportModel data = new AdminReportModel();
            data.setExportId(rs.getInt("Export_ID"));
            data.setReportType(rs.getString("Report_Type"));
            data.setExportedBy(rs.getString("Exported_By"));
            data.setExportDate(rs.getString("Export_Date").substring(0, 16).replace("T", " "));
            data.setRowCount(rs.getInt("Row_Count"));
            data.setStatus(rs.getString("Status"));
            datas.add(data);
        }
        
        rs.close();
        pst.close();
        conn.close();
        
        return datas;
    }
}