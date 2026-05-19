package com.model;

public class ProductListingModel 
{
	private int productId;
    private String productName;
    private String productDescription;
    private double productPrice;
    private int stockQuantity;
    private String activeStatus;
    private String listedDate;
    private int categoryId;
    private String categoryName;
    private int sellerId;

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

    public String getProductDescription() 
    { 
    	return productDescription; 
    }
    
    public void setProductDescription(String productDescription) 
    { 
    	this.productDescription = productDescription; 
    }

    public double getProductPrice() 
    { 
    	return productPrice; 
    }
    
    public void setProductPrice(double productPrice) 
    { 
    	this.productPrice = productPrice; 
    }

    public int getStockQuantity() 
    { 
    	return stockQuantity; 
    }
    
    public void setStockQuantity(int stockQuantity) 
    { 
    	this.stockQuantity = stockQuantity; 
    }

    public String getActiveStatus() 
    { 
    	return activeStatus; 
    }
    
    public void setActiveStatus(String activeStatus) 
    { 
    	this.activeStatus = activeStatus; 
    }

    public String getListedDate() 
    { 
    	return listedDate; 
    }
    
    public void setListedDate(String listedDate) 
    { 
    	this.listedDate = listedDate; 
    }

    public int getCategoryId() 
    { 
    	return categoryId; 
    }
    
    public void setCategoryId(int categoryId) 
    { 
    	this.categoryId = categoryId; 
    }

    public String getCategoryName() 
    { 
    	return categoryName; 
    }
    
    public void setCategoryName(String categoryName) 
    { 
    	this.categoryName = categoryName; 
    }

    public int getSellerId() 
    { 
    	return sellerId; 
    }
    
    public void setSellerId(int sellerId) 
    { 
    	this.sellerId = sellerId; 
    }
}