package com.model;

public class FlaggedItemsModel {
    private int productId;
    private String productName;
    private String reportedBy;
    private String reason;
    private String dateReported;
    private String isFlagged;

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

    public String getReportedBy() { 
    	return reportedBy; 
    }
    
    public void setReportedBy(String reportedBy) { 
    	this.reportedBy = reportedBy; 
    }

    public String getReason() { 
    	return reason; 
    }
    
    public void setReason(String reason) { 
    	this.reason = reason; 
    }

    public String getDateReported() { 
    	return dateReported; 
    }
    
    public void setDateReported(String dateReported) { 
    	this.dateReported = dateReported; 
    }

    public String getIsFlagged() { 
    	return isFlagged; 
    }
    
    public void setIsFlagged(String isFlagged) { 
    	this.isFlagged = isFlagged; 
    }
}