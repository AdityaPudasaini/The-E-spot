package com.model;

public class AdminUserModel {
    private int memberId;
    private String memberName;
    private String memberEmail;
    private String memberUsername;
    private String accountStatus;
    private String memberRole;
    private String createdAt;
    private int totalOrders;

    public int getMemberId() 
    { 
    	return memberId; 
    }
    
    public void setMemberId(int memberId) 
    { 
    	this.memberId = memberId; 
    }

    public String getMemberName() 
    { 
    	return memberName; 
    }
    
    public void setMemberName(String memberName) 
    { 
    	this.memberName = memberName; 
    }

    public String getMemberEmail() { 
    	return memberEmail; 
    }
    
    public void setMemberEmail(String memberEmail) 
    { 
    	this.memberEmail = memberEmail; 
    }

    public String getMemberUsername() 
    { 
    	return memberUsername; 
    }
    
    public void setMemberUsername(String memberUsername) 
    { 
    	this.memberUsername = memberUsername; 
    }

    public String getAccountStatus() { 
    	return accountStatus; 
    }
    
    public void setAccountStatus(String accountStatus) 
    { 
    	this.accountStatus = accountStatus; 
    }

    public String getMemberRole() 
    { 
    	return memberRole; 
    }
    
    public void setMemberRole(String memberRole) 
    { 
    	this.memberRole = memberRole; 
    }

    public String getCreatedAt() 
    { 
    	return createdAt; 
    }
    
    public void setCreatedAt(String createdAt) 
    { 
    	this.createdAt = createdAt; 
    }

    public int getTotalOrders() 
    { 
    	return totalOrders; 
    }
    
    public void setTotalOrders(int totalOrders) 
    { 
    	this.totalOrders = totalOrders; 
    }
}