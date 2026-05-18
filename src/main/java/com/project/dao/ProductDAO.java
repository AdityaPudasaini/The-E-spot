package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.model.ProductModel;
import com.project.utils.DBconfig;

public class ProductDAO {
	 public List<ProductModel> getAllProducts() throws SQLException {
	        List<ProductModel> products = new ArrayList<>();
	        String sql = "SELECT * FROM product";

	        Connection conn = DBconfig.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery(); 

	            while (rs.next()) {
	                ProductModel p = new ProductModel();
	                p.setProductId(rs.getInt("Product_ID"));
	                p.setCategoryId(rs.getInt("Category_ID"));
	                p.setSellerId(rs.getInt("Seller_ID"));
	                p.setProductName(rs.getString("Product_Name"));
	                p.setProductDescription(rs.getString("Product_Description"));
	                p.setProductPrice(rs.getDouble("Product_Price"));
	                p.setStockQuantity(rs.getInt("Stock_Quantity"));
	                p.setListedDate(rs.getDate("Listed_Date"));
	                p.setActiveStatus(rs.getString("Active_Status"));
	                products.add(p);
	            }

	        
	        System.out.println("=== Total products returned: " + products.size() + " ===");
	        conn.close();
	        ps.close();
	        rs.close();
	        return products;
	    }

	    public ProductModel getProductById(int id) {
	        ProductModel p = null;
	        String sql = "SELECT * FROM product WHERE Product_ID = ?";

	        try (Connection conn = DBconfig.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {

	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                p = new ProductModel();
	                p.setProductId(rs.getInt("Product_ID"));
	                p.setCategoryId(rs.getInt("Category_ID"));
	                p.setSellerId(rs.getInt("Seller_ID"));
	                p.setProductName(rs.getString("Product_Name"));
	                p.setProductDescription(rs.getString("Product_Description"));
	                p.setProductPrice(rs.getDouble("Product_Price"));
	                p.setStockQuantity(rs.getInt("Stock_Quantity"));
	                p.setListedDate(rs.getDate("Listed_Date"));
	                p.setActiveStatus(rs.getString("Active_Status"));
	            }
	            conn.close();
		        ps.close();
		        rs.close();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return p;
	    }
	    
	    public boolean addProduct(ProductModel product) throws SQLException {
	    	String sql = "INSERT INTO product (Category_ID, Seller_ID, Product_Name, Product_Description, " +
	                "Product_Price, Stock_Quantity, Active_Status) VALUES (?, ?, ?, ?, ?, 1, ?)";

	        Connection conn = DBconfig.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);

	        	ps.setInt(1, product.getCategoryId());
	        	ps.setInt(2, product.getSellerId());
	        	ps.setString(3, product.getProductName());
	        	ps.setString(4, product.getProductDescription());
	        	ps.setDouble(5, product.getProductPrice());
	        	ps.setString(6, product.getActiveStatus());

	            int rows = ps.executeUpdate();
	            conn.close();
	            ps.close();
	            return rows > 0;
	            
	      
	    }
}
