package com.model;

public class AdminFlaggedModel {
    private int flagId;
    private String productName;
    private String reportedBy;
    private String reason;
    private String dateReported;
    private String flagStatus;
    private int productId;

    public int getFlagId() 
    { 
    	return flagId; 
    }
    
    public void setFlagId(int flagId) 
    { 
    	this.flagId = flagId; 
    }

    public String getProductName() 
    { 
    	return productName; 
    }
    
    public void setProductName(String productName) 
    {
    	this.productName = productName; 
    }

    public String getReportedBy() 
    { 
    	return reportedBy; 
    }
    
    public void setReportedBy(String reportedBy) 
    { 
    	this.reportedBy = reportedBy; 
    }

    public String getReason() 
    { 
    	return reason; 
    }
    
    public void setReason(String reason) 
    { 
    	this.reason = reason; 
    }

    public String getDateReported() 
    { 
    	return dateReported; 
    }
    
    public void setDateReported(String dateReported) 
    { 
    	this.dateReported = dateReported; 
    }

    public String getFlagStatus() 
    { 
    	return flagStatus; 
    }
    
    public void setFlagStatus(String flagStatus) 
    { 
    	this.flagStatus = flagStatus; 
    }

    public int getProductId() 
    { 
    	return productId; 
    }
    public void setProductId(int productId) 
    { 
    	this.productId = productId; 
    }
}