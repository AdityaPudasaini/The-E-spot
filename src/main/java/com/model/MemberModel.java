package com.model;

import java.util.Date;


public class MemberModel{

	private String name;
    private String userName;
    private Date dob;
    private String email;
    private String number;
    private String password;
    private Date createdDate;
    private String accountStatus;

    
    public String getName() 
    { 
    	return name; 
    }
    
    public void setName(String name) 
    { 
    	this.name = name; 
    }

    public String getUserName() 
    { 
    	return userName; 
    }
    
    public void setUserName(String userName) 
    { 
    	this.userName = userName; 
    }

    public Date getDob() 
    { 
    	return dob; 
    }
    
    public void setDob(Date dob) 
    { 
    	this.dob = dob; 
    }

    public String getEmail() 
    { 
    	return email; 
    }
    
    public void setEmail(String email) 
    { 
    	this.email = email; 
    }

    public String getNumber() 
    { 
    	return number; 
    }
    
    public void setNumber(String number) 
    { 
    	this.number = number; 
    }
    
    public String getPassword() 
    { 
    	return password; 
    }
    
    public void setPassword(String password) 
    { 
    	this.password = password; 
    }
	
    public String getAccountStatus() 
    { 
    	return accountStatus; 
    }
    
    public void setAccountStatus(String accountStatus) 
    { 
    	this.accountStatus = accountStatus; 
    }
    
    public Date getCreatedDate() 
    { 
    	return createdDate; 
    }
    
    public void setCreatedDate(Date createdDate) 
    { 
    	this.createdDate = createdDate; 
    }
}
