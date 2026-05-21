package com.model;

public class AdminRevenueModel {
    private int orderId;
    private String customerName;
    private String productName;
    private String categoryName;
    private String amount;
    private String orderDate;
    private String orderStatus;

    public int getOrderId() 
    { 
    	return orderId; 
    }
    
    public void setOrderId(int orderId) 
    { 
    	this.orderId = orderId; 
    }

    public String getCustomerName() { 
    	return customerName; 
    }
    
    public void setCustomerName(String customerName) 
    { 
    	this.customerName = customerName; 
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

    public String getAmount() 
    {
    	return amount; 
    }
    public void setAmount(String amount) 
    { 
    	this.amount = amount; 
    }

    public String getOrderDate() 
    { 
    	return orderDate; 
    }
    public void setOrderDate(String orderDate) 
    { 
    	this.orderDate = orderDate; 
    }

    public String getOrderStatus() 
    { 
    	return orderStatus; 
    }
    public void setOrderStatus(String orderStatus) 
    { 
    	this.orderStatus = orderStatus; 
    }
}