package com.model;

public class AdminListingModel {
    private int productId;
    private String productName;
    private String categoryName;
    private String productPrice;
    private int stockQuantity;
    private String activeStatus;
    private boolean isFlagged;
    private String listedDate;
    
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
    
    public String getProductPrice() { 
    	return productPrice; 
    }
    
    public void setProductPrice(String productPrice) { 
    	this.productPrice = productPrice; 
    }
    
    public int getStockQuantity() { 
    	return stockQuantity; 
    }
    
    public void setStockQuantity(int stockQuantity) { 
    	this.stockQuantity = stockQuantity; 
    }
    
    public String getActiveStatus() { 
    	return activeStatus; 
    }
    
    public void setActiveStatus(String activeStatus) { 
    	this.activeStatus = activeStatus; 
    }
    
    public boolean getIsFlagged() { 
    	return isFlagged; 
    }
    
    public void setIsFlagged(boolean isFlagged) { 
    	this.isFlagged = isFlagged; 
    }
    
    public String getListedDate() { 
    	return listedDate; 
    }
    
    public void setListedDate(String listedDate) { 
    	this.listedDate = listedDate; 
    }
}