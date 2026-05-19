package com.model;

public class UserStatsModel {
	private String totalRevenue;
    private int totalBought;
    private int totalSold;
    private String totalSpent;
 
    public String getTotalRevenue()         
    { 
    	return totalRevenue; 
    }
    
    public void setTotalRevenue(String totalRevenue) 
    { 
    	this.totalRevenue = totalRevenue; 
    }
 
    public int getTotalBought()            
    { 
    	return totalBought; 
    }
    
    public void setTotalBought(int totalBought)       
    { 
    	this.totalBought = totalBought; 
    }
 
    public int getTotalSold()              
    { 
    	return totalSold; 
    }
    
    public void setTotalSold(int totalSold)         
    { 
    	this.totalSold = totalSold; 
    }
 
    public String getTotalSpent()           
    { 
    	return totalSpent; 
    }
    
    public void setTotalSpent(String totalSpent)   
    { 
    	this.totalSpent = totalSpent; 
    }
}
