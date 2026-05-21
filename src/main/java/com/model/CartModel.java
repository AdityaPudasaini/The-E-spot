package com.model;

public class CartModel {

    private int cartItemId;
    private int productId;
    private String productName;
    private String categoryName;
    private double productPrice;
    private int quantity;
    private double totalPrice;
    private int stockQuantity;

    public int getStockQuantity() 
    { 
    	return stockQuantity; 
    }
    
    public void setStockQuantity(int stockQuantity) 
    { 
    	this.stockQuantity = stockQuantity; 
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public String getTotal() {
        double total = productPrice * quantity;
        return String.format("%.2f", total);
    }
    
    public String getFormattedPrice() {
        return String.format("%.2f", productPrice);
    }
}