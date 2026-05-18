package com.model;

public class AdminFlaggedModel {
    private int productId;
    private String productName;
    private String categoryName;
    private String sellerName;
    private String listedDate;
    private String activeStatus;

    public int getProductId() 
    { 
    	return productId; 
    }
    
    public void setProductId(int productId) 
    { 
    	this.productId = productId; 
    }

    public String getProductName() 
    { 
    	return productName; 
    }
    
    public void setProductName(String productName) 
    { 
    	this.productName = productName; 
    }

    public String getCategoryName() 
    { 
    	return categoryName; 
    }
    
    public void setCategoryName(String categoryName) 
    { 
    	this.categoryName = categoryName; 
    }

    public String getSellerName() 
    { 
    	return sellerName; 
    }
    
    public void setSellerName(String sellerName) 
    { 
    	this.sellerName = sellerName; 
    }

    public String getListedDate() 
    { 
    	return listedDate; 
    }
    
    public void setListedDate(String listedDate) 
    { 
    	this.listedDate = listedDate; 
    }

    public String getActiveStatus() 
    { 
    	return activeStatus; 
    }
    
    public void setActiveStatus(String activeStatus) 
    { 
    	this.activeStatus = activeStatus; 
    }
}