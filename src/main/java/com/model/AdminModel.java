package com.model;

public class AdminModel {
	private String name;
    private String email;
    private String password;
    private String permission;
    private String username;

    
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
    	return username;
    }
    
    public void setUserName(String username)
    {
    	this.username = username;
    }

    public String getEmail() 
    { 
    	return email; 
    }
    
    public void setEmail(String email) 
    { 
    	this.email = email; 
    }
    
	public String getPassword() 
	{ 
		return password; 
	}
	    
	public void setPassword(String password) 
	{ 
		this.password = password; 
	}
	
    public String getPermission() 
    { 
    	return permission; 
    }
    
    public void setPermission(String permission) 
    { 
    	this.permission = permission; 
    }
    
    
	
}
