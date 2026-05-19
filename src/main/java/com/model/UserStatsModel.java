package com.model;

public class UserStatsModel {
	private double totalRevenue;
    private int totalBought;
    private int totalSold;
    private double totalSpent;
 
    public double getTotalRevenue()         
    { 
    	return totalRevenue; 
    }
    
    public void setTotalRevenue(double totalRevenue) 
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
 
    public double getTotalSpent()           
    { 
    	return totalSpent; 
    }
    
    public void setTotalSpent(double v)   
    { 
    	this.totalSpent = v; 
    }
}
